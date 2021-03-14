// Package collatzconjecture implements the solution to the collatz exercise on exercism
package collatzconjecture

import "errors"

var errInvalidNumber = errors.New("invalid number")

// CollatzConjecture return the number of steps required to reach 1 from n
func CollatzConjecture(n int) (steps int, err error) {
	if n < 1 {
		err = errInvalidNumber
	}

	for n > 1 {
		n = collatz(n)
		steps++
	}

	return
}

func collatz(n int) int {
	if n%2 == 0 {
		return n / 2
	}

	return n*3 + 1
}
