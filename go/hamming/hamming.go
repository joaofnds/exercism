package hamming

import "errors"

var errDifferentLength = errors.New("strands must have the same length")

// Distance calculates the Hamming Distance between two DNA strands
func Distance(a, b string) (int, error) {
	var distance int
	runeA, runeB := []rune(a), []rune(b)

	if len(runeA) != len(runeB) {
		return distance, errDifferentLength
	}

	for i := 0; i < len(runeA); i++ {
		if runeA[i] != runeB[i] {
			distance++
		}
	}

	return distance, nil
}
