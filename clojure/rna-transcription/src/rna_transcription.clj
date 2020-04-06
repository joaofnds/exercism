(ns rna-transcription)

(defn dna-nucleotide-complement
  [dna-nucleotide]
  {:pre [(.contains [\C \G \A \T] dna-nucleotide)]}
  (case dna-nucleotide
    \C \G
    \G \C
    \A \U
    \T \A))

(defn to-rna [dna]
  (apply str (map dna-nucleotide-complement dna)))
