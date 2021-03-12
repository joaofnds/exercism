// Package strand implements the solution to the strand exercise on exercism
package strand

// ToRNA return the RNA complement of the given dna
func ToRNA(dna string) string {
	var result string

	for _, n := range dna {
		result = result + string(nucleotideComplement(n))
	}

	return result
}

func nucleotideComplement(n rune) rune {
	switch n {
	case 'A':
		return 'U'
	case 'C':
		return 'G'
	case 'T':
		return 'A'
	case 'G':
		return 'C'
	default:
		return 0
	}
}
