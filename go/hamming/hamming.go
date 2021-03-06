package hamming

import "errors"

var DifferentLengthError = errors.New("strands must have the same length")

func Distance(a, b string) (int, error) {
	var distance int

	if len(a) != len(b) {
		return distance, DifferentLengthError
	}

	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			distance++
		}
	}

	return distance, nil
}
