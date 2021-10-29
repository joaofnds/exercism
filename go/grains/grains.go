package grains

import (
	"fmt"
)

func Square(n int) (uint64, error) {
	if n > 64 || n < 1 {
		return 0, fmt.Errorf("invalid square '%d'", n)
	}

	return uint64(1 << (n - 1)), nil
}

func Total() uint64 {
	return ^uint64(0)
}
