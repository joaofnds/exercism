(ns hamming)

(defn dna-diferences
  [strand1 strand2]
  (filter #(apply not= %) (map vector strand1 strand2)))

(defn distance [strand1 strand2]
  (when (= (count strand1) (count strand2))
    (count (dna-diferences strand1 strand2))))
