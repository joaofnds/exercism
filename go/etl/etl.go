package etl

import "strings"

func Transform(in map[int][]string) map[string]int {
	result := map[string]int{}

	for points, strs := range in {
		for _, letter := range strs {
			result[strings.ToLower(letter)] = points
		}
	}

	return result
}
