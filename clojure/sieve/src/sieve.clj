(ns sieve)

(defn- divisible-by? [divisor dividend]
  (zero? (mod dividend divisor)))

(defn- genlist [n]
  (reduce #(assoc %1 %2 false) {} (range 2 (inc n))))

(defn sieve [n]
  (loop [l (genlist n) i 2 j 3]
    (let [marked? (l j)]
      (cond
        (> i n) (into [] (sort (map first (filter (complement second) l))))
        (> j n) (recur l (inc i) (+ 2 i))
        (and (not marked?) (divisible-by? i j)) (recur (assoc l j true) i (inc j))
        :else (recur l i (inc j))))))
