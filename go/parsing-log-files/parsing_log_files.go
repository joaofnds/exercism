package parsinglogfiles

import (
	"fmt"
	"regexp"
)

var (
	logFormat      = regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`)
	splitFormat    = regexp.MustCompile(`<[-=~*]*>`)
	passwordFormat = regexp.MustCompile(`(?i)".*password.*"`)
	eolFormat      = regexp.MustCompile(`end-of-line\d*`)
	usernameFormat = regexp.MustCompile(`User\s+(\w+)`)
)

func IsValidLine(text string) bool {
	return logFormat.MatchString(text)
}

func SplitLogLine(text string) []string {
	return splitFormat.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	var count int
	for _, line := range lines {
		if passwordFormat.MatchString(line) {
			count++
		}
	}
	return count
}

func RemoveEndOfLineText(text string) string {
	return eolFormat.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	for i, line := range lines {
		usernameMatches := usernameFormat.FindStringSubmatch(line)
		if usernameMatches != nil {
			line = fmt.Sprintf("[USR] %s %s", usernameMatches[1], line)
		}
		lines[i] = line
	}
	return lines
}
