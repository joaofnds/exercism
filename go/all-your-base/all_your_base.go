package allyourbase

import "errors"

func ConvertToBase(base int, digits []int, outputBase int) ([]int, error) {
	if base < 2 {
		return nil, errors.New("input base must be >= 2")
	}
	if outputBase < 2 {
		return nil, errors.New("output base must be >= 2")
	}

	var sum int
	for _, d := range digits {
		if !(0 <= d && d < base) {
			return nil, errors.New("all digits must satisfy 0 <= d < input base")
		}
		sum = sum*base + d
	}

	if sum == 0 {
		return []int{0}, nil
	}

	var result []int
	for ; sum > 0; sum /= outputBase {
		result = append([]int{sum % outputBase}, result...)
	}
	return result, nil
}
