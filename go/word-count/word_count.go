package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	r := regexp.MustCompile(`\w+(\'t)?`)
	words := r.FindAllString(strings.ToLower(phrase), -1)

	frequencies := Frequency{}
	for _, w := range words {
		frequencies[strings.ToLower(w)]++
	}
	return frequencies
}
