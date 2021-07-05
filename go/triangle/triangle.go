// Package triangle implements the solution to the triangle exercise on exercism
package triangle

import "math"

type Kind int

const (
	NaT Kind = -1 // not a triangle
	Equ Kind = 3  // equilateral
	Iso Kind = 2  // isosceles
	Sca Kind = 0  // scalene
)

// KindFromSides returns the type of triangle given its sides length
func KindFromSides(a, b, c float64) Kind {
	if isValid(a, b, c) {
		switch {
		case a != b && b != c && c != a:
			return Sca
		case a == b && b == c && c == a:
			return Equ
		case a == b || b == c || c == a:
			return Iso
		}
	}

	return NaT
}

func isValid(a, b, c float64) bool {
	for _, v := range []float64{a, b, c} {
		if math.IsNaN(v) || math.IsInf(v, 0) || v == 0 {
			return false
		}
	}

	if (a+b) < c || (b+c) < a || (c+a) < b {
		return false
	}

	return true
}
