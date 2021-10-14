package logs

import "strings"

var appMap = map[rune]string{
	'❗': "recommendation",
	'🔍': "search",
	'☀': "weather",
}

// Application identifies the application emitting the given log.
func Application(log string) string {
	for v := range appMap {
		if strings.Contains(log, string(v)) {
			return appMap[v]
		}
	}
	return "default"
}

// Replace replaces all occurances of old with new, returning the modified log
// to the caller.
func Replace(log string, old, new rune) string {
	return strings.ReplaceAll(log, string(old), string(new))
}

// WithinLimit determines whether or not the number of characters in log is
// within the limit.
func WithinLimit(log string, limit int) bool {
	return len([]rune(log)) <= limit
}
