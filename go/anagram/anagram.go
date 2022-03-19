package anagram

import (
	"sort"
	"strings"
)

func Detect(subject string, candidates []string) []string {
	subject = strings.ToLower(subject)

	var anagrams []string
	for _, candidate := range candidates {
		if isAnagram(subject, strings.ToLower(candidate)) {
			anagrams = append(anagrams, candidate)
		}
	}
	return anagrams
}

func isAnagram(subject, candidate string) bool {
	if len(subject) != len(candidate) {
		return false
	}

	if subject == candidate {
		return false
	}

	return sortedString(subject) == sortedString(candidate)
}

func sortedString(s string) string {
	bytes := []byte(s)
	sort.Slice(bytes, func(i, j int) bool {
		return bytes[i] < bytes[j]
	})
	return string(bytes)
}
