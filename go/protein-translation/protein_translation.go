package protein

import (
	"errors"
)

var (
	ErrStop        = errors.New("STOP")
	ErrInvalidBase = errors.New("Invalid Base")

	asdf = map[string]string{
		"AUG":          "Methionine",
		"UUUUUC":       "Phenylalanine",
		"UUAUUG":       "Leucine",
		"UCUUCCUCAUCG": "Serine",
		"UAUUAC":       "Tyrosine",
		"UGUUGC":       "Cysteine",
		"UGG":          "Tryptophan",
		"UAAUAGUGA":    "STOP",
	}
)

// Convert a codon into a protein
func FromCodon(codon string) (string, error) {
	switch codon {
	case "AUG":
		return "Methionine", nil
	case "UUU", "UUC":
		return "Phenylalanine", nil
	case "UUA", "UUG":
		return "Leucine", nil
	case "UCU", "UCC", "UCA", "UCG":
		return "Serine", nil
	case "UAU", "UAC":
		return "Tyrosine", nil
	case "UGU", "UGC":
		return "Cysteine", nil
	case "UGG":
		return "Tryptophan", nil
	case "UAA", "UAG", "UGA":
		return "", ErrStop
	default:
		return "", ErrInvalidBase
	}
}

// Convert an RNA strand into an array of proteins
func FromRNA(strand string) ([]string, error) {
	proteins := make([]string, 0, len(strand)/3)

	for i := 0; i < len(strand); i += 3 {
		protein, err := FromCodon(strand[i : i+3])

		if err == ErrStop {
			break
		}

		if err == ErrInvalidBase {
			return proteins, err
		}

		proteins = append(proteins, protein)
	}

	return proteins, nil
}
