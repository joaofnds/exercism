// Package strand implements the solution to the strand exercise on exercism
package strand

type nucleotide = rune

var DNAComplement = map[rune]rune{
	'A': 'U',
	'C': 'G',
	'T': 'A',
	'G': 'C',
}

// ToRNA return the RNA complement of the given dna
func ToRNA(dna string) string {
	result := make([]nucleotide, len(dna))

	for i, n := range dna {
		result[i] = DNAComplement[n]
	}

	return string(result)
}
