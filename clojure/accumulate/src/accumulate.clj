(ns accumulate)

(defn accumulate [f coll]
  (reduce #(conj %1 (f %2)) [] coll))
