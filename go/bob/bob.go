// Package bob implements the solution to the bob exercise on exercism
package bob

import "strings"

// Hey returns Bob's answer given the remark
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)

	switch {
	case remark == "":
		return "Fine. Be that way!"
	case isQuestion(remark) && isYell(remark):
		return "Calm down, I know what I'm doing!"
	case isQuestion(remark):
		return "Sure."
	case isYell(remark):
		return "Whoa, chill out!"
	default:
		return "Whatever."
	}
}

func isYell(s string) bool {
	return hasLetters(s) && s == strings.ToUpper(s)
}

func isQuestion(s string) bool {
	return strings.HasSuffix(s, "?")
}

func hasLetters(s string) bool {
	return strings.ToLower(s) != strings.ToUpper(s)
}
