package dna

import "errors"

var errInvalidNucletodie = errors.New("invalid nucleotide")

// Histogram is a mapping from nucleotide to its count in given DNA.
type Histogram map[rune]int

func newHistogram() Histogram {
	return Histogram{
		'A': 0,
		'C': 0,
		'T': 0,
		'G': 0,
	}
}

// DNA is a list of nucleotides.
type DNA string

// Counts generates a histogram of valid nucleotides in the given DNA.
// Returns an error if d contains an invalid nucleotide.
func (d DNA) Counts() (Histogram, error) {
	var h Histogram = newHistogram()
	for _, c := range d {
		if _, ok := h[c]; ok {
			h[c]++
		} else {
			return h, errInvalidNucletodie
		}
	}
	return h, nil
}
