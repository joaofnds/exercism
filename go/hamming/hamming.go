package hamming

import "errors"

var DifferentLengthError = errors.New("strands must have the same length")

func Distance(a, b string) (int, error) {
	var distance int
	runeA, runeB := []rune(a), []rune(b)

	if len(runeA) != len(runeB) {
		return distance, DifferentLengthError
	}

	for i := 0; i < len(runeA); i++ {
		if runeA[i] != runeB[i] {
			distance++
		}
	}

	return distance, nil
}
