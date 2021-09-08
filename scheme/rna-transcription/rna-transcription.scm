(import (rnrs))

(define (translate-nucleotide nucleotide)
  (case nucleotide
    ((#\G) #\C)
    ((#\C) #\G)
    ((#\T) #\A)
    ((#\A) #\U)))

(define (dna->rna dna)
  (string-map translate-nucleotide dna))
