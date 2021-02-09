(ns binary-search)

(defn middle [coll]
  (let [size (count coll)]
    (int (/ size 2))))

(defn search-for [n coll]
  (loop [low 0 high (count coll)]
    (if (<= high low)
      (throw (Exception. "not found"))
      (let [mid (int (+ low (/ (- high low) 2)))]
        (case (compare n (nth coll mid))
          -1 (recur low mid)
          0  mid
          1  (recur (inc mid) high))))))
