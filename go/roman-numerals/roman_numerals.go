package romannumerals

import (
	"fmt"
	"strings"
)

type Roman struct {
	value  int
	symbol string
}

var mappings = []Roman{
	{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
	{100, "C"},  {90, "XC"},  {50, "L"},  {40, "XL"},
	{10, "X"},   {9, "IX"},   {5, "V"},   {4, "IV"},
	{1, "I"},
}

func ToRomanNumeral(in int) (string, error) {
	if in <= 0 || in > 3000 {
		return "", fmt.Errorf("out of range, not defined for %d", in)
	}

	var out strings.Builder

	for _, m := range mappings {
		for in >= m.value {
			out.WriteString(m.symbol)
			in -= m.value
		}
	}

	return out.String(), nil
}
