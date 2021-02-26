(ns spiral-matrix)

(defn- rotate
  "rotates 90 degrees counter-clockwise"
  [[x y]] [(- y) x])

(defn- move [[x y] [dx dy]]
  [(+ x dx) (+ y dy)])

(defn- make-matrix [size]
  (into [] (map #(into [] %) (partition size (range (* size size))))))

(defn- trail [side]
  (let [area (* side side)]
    (if (zero? area)
      []
      (loop [pos [0 0] dir [1 0] trail []]
        (let [next (move pos dir)
              rotate? (or (some #(or (neg? %) (> (inc %) side)) next)
                          (some #(= next %) trail))]
          (cond
            (= (dec area) (count trail)) (conj trail pos)
            rotate? (recur pos (rotate dir) trail)
            :else (recur (move pos dir) dir (conj trail pos))))))))

(defn spiral [n]
  (reduce
   (fn [m [i [x y]]] (assoc-in m [y x] (inc i)))
   (make-matrix n)
   (map-indexed list (trail n))))
