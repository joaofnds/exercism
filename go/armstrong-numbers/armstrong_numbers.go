package armstrong

import (
	"math"
)

func IsNumber(n int) bool {
	return n == armstrongSum(n)
}

func armstrongSum(n int) int {
	var sum int
	nums := digits(n)

	for _, n := range nums {
		sum += pow(n, len(nums))
	}

	return sum
}

func digits(n int) []int {
	digits := []int{}

	for r := n; r > 0; r /= 10 {
		digits = append(digits, r%10)
	}

	return digits
}

func pow(a, b int) int {
	return int(math.Pow(float64(a), float64(b)))
}
