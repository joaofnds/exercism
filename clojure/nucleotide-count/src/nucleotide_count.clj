(ns nucleotide-count)

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (get (nucleotide-counts strand) nucleotide))

(defn nucleotide-counts [strand]
  (reduce #(merge-with + %1 {%2 1})
          {\A 0 \T 0 \C 0 \G 0}
          strand))
