(ns rna-transcription)

(def dna->rna-hash
  {\C \G
   \G \C
   \A \U
   \T \A})

(defn dna-nucleotide-complement
  [dna-nucleotide]
  {:pre [(contains? dna->rna-hash dna-nucleotide)]}
  (get dna->rna-hash dna-nucleotide))

(defn to-rna [dna]
  (apply str (map dna-nucleotide-complement dna)))
