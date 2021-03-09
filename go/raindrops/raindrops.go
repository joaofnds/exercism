// Package raindrops implements the solution to the raindrops exercise on exercism
package raindrops

import "strconv"

// Convert turns a number into a string that contains raindrop
// sounds corresponding to certain potential factors
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
