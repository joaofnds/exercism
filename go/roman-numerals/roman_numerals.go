package romannumerals

import (
	"errors"
)

type Roman struct {
	numeral int
	symbol  string
}

var intRoman = []Roman{
	{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
	{100, "C"},  {90, "XC"},  {50, "L"},  {40, "XL"},
	{10, "X"},   {9, "IX"},   {5, "V"},   {4, "IV"},
	{1, "I"},
}

func ToRomanNumeral(in int) (string, error) {
	if in > 3000 {
		return "", errors.New("I could keep going but they don't want me too")
	}

	var out string

	for {
		r, err := closestRoman(in)
		if err != nil {
			break
		}

		out += r.symbol
		in -= r.numeral
	}

	if in != 0 || out == "" {
		return "", errors.New("could not convert")
	}

	return out, nil
}

func closestRoman(n int) (Roman, error) {
	for _, r := range intRoman {
		if n >= r.numeral {
			return r, nil
		}
	}
	return Roman{}, errors.New("no value found")
}
