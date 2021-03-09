package raindrops

import "strconv"

func Convert(n int) string {
	var output string

	if n%3 == 0 {
		output += "Pling"
	}

	if n%5 == 0 {
		output += "Plang"
	}

	if n%7 == 0 {
		output += "Plong"
	}

	if output == "" {
		output += strconv.Itoa(n)
	}

	return output
}
