(ns prime-factors)

(defn of [n]
  (loop [factors [] i 2 j n]
    (cond
      (< j 2) factors
      (zero? (rem j i)) (recur (conj factors i) i (/ j i))
      :else (recur factors (inc i) j))))
