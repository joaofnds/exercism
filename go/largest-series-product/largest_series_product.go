package lsproduct

import (
	"errors"
	"fmt"
)

func LargestSeriesProduct(str string, span int) (int64, error) {
	if !(0 <= span && span <= len(str)) {
		return 0, errors.New("span must be in [0, len(str)]")
	}

	digits, err := toDigits(str)
	if err != nil {
		return 0, err
	}

	var max int64
	for i := 0; i <= len(digits)-span; i++ {
		if p := product(digits[i : i+span]); p > max {
			max = p
		}
	}
	return max, nil
}

func toDigits(str string) ([]int64, error) {
	out := make([]int64, len(str))

	for i, c := range str {
		if d := int64(c - '0'); 0 <= d && d <= 9 {
			out[i] = d
		} else {
			return nil, fmt.Errorf("invalid digit %q", d)
		}

	}

	return out, nil
}

func product(nums []int64) int64 {
	var p int64 = 1
	for _, d := range nums {
		p *= d
	}
	return p
}
