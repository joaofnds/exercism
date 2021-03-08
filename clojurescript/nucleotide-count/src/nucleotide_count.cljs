(ns nucleotide-count)

(defn count-of-nucleotide-in-strand [nucleotide dna-strand]
  {:pre [(contains? #{\A \C \T \G} nucleotide)]}
  (count (filter #{nucleotide} dna-strand)))

(defn nucleotide-counts [dna-strand]
  (merge {\A 0 \T 0 \C 0 \G 0}
         (frequencies dna-strand)))
