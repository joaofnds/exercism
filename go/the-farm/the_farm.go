package thefarm

import (
	"errors"
	"fmt"
)

var (
	DivisionByZeroErr = errors.New("Division by zero")
	NegativeFodderErr = errors.New("Negative fodder")
)

type SillyNephewError int

func (cows SillyNephewError) Error() string {
	return fmt.Sprintf("silly nephew, there cannot be %d cows", cows)
}

// DivideFood computes the fodder amount per cow for the given cows.
func DivideFood(weightFodder WeightFodder, cows int) (float64, error) {
	amount, fodderErr := weightFodder.FodderAmount()

	switch {
	case cows == 0:
		return 0, DivisionByZeroErr
	case cows < 0:
		return 0, SillyNephewError(cows)
	case amount < 0:
		return 0, NegativeFodderErr
	case errors.Is(fodderErr, ErrScaleMalfunction):
		return (amount * 2) / float64(cows), nil
	case fodderErr != nil:
		return 0, fodderErr
	default:
		return amount / float64(cows), nil
	}
}
