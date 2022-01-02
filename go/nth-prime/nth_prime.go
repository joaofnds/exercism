package prime

import "math"

func isPrime(n int) bool {
	if n%2 == 0 {
		return n == 2
	}

	max := int(math.Sqrt(float64(n)))
	for i := 3; i <= max; i += 2 {
		if n%i == 0 {
			return false
		}
	}

	return true
}

func Nth(i int) (int, bool) {
	if i <= 0 {
		return 0, false
	}

	for nth := 2; ; nth++ {
		if isPrime(nth) {
			i--
		}
		if i == 0 {
			return nth, true
		}
	}
}
