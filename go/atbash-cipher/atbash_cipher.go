package atbash

import (
	"strings"
	"unicode"
)

const chunkSize = 5

func Atbash(s string) string {
	var out strings.Builder
	var i int

	for _, r := range s {
		r = lower(r)
		if !isAlphaNumeric(r) {
			continue
		}

		out.WriteRune(encode(r))

		i++
		if i%chunkSize == 0 {
			out.WriteByte(' ')
		}
	}

	return strings.TrimRightFunc(out.String(), unicode.IsSpace)
}

func lower(r rune) rune {
	if 'A' <= r && r <= 'Z' {
		r += 'a' - 'A'
	}
	return r
}

func isAlphaNumeric(r rune) bool {
	return ('0' <= r && r <= '9') || ('a' <= r && r <= 'z')
}

func encode(r rune) rune {
	if 'a' <= r && r <= 'z' {
		return ('a' - r) + 'z'
	}

	return r
}
