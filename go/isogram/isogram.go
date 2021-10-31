package isogram

import "unicode"

func IsIsogram(word string) bool {
	seen := map[rune]bool{}

	for _, r := range word {
		if !unicode.IsLetter(r) {
			continue
		}

		if unicode.IsUpper(r) {
			r = unicode.ToLower(r)
		}

		if _, ok := seen[r]; ok {
			return false
		} else {
			seen[r] = true
		}
	}

	return true
}
