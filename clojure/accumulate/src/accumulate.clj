(ns accumulate)

(defn accumulate [f seq]
  (reduce #(conj %1 (f %2)) [] seq))
