(ns binary-search)

(defn search-for [x xs]
  (loop [left 0 right (count xs)]
    (if (>= left right)
      (throw (js/Error. "not found")))

    (let [mid (int (/ (+ right left) 2))]
      (case (compare x (nth xs mid))
        -1 (recur left mid)
        0 mid
        1 (recur (inc mid) right)))))

(defn middle [xs]
  (int (/ (count xs) 2)))