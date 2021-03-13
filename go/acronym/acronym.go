// Package acronym implements the solution to the acronym exercise on exercism
package acronym

import (
	"strings"
	"unicode"
)

// Abbreviate converts a phrase to its acronym.
func Abbreviate(s string) string {
	result := []rune{}
	prev := ' '

	for _, r := range s {
		if (!unicode.IsLetter(prev) && prev != '\'') && unicode.IsLetter(r) {
			result = append(result, r)
		}

		prev = r
	}

	return strings.ToUpper(string(result))
}
