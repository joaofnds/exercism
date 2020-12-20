(ns pascals-triangle)

(defn- fact [n]
  (reduce * (range 1N (inc n))))

(defn- n-choose-k [n k]
  (/ (fact n)
     (* (fact k) (fact (- n k)))))

(defn row [n]
  (map #(n-choose-k (dec n) %) (range n)))

(def triangle
  (map (comp row inc) (range)))
