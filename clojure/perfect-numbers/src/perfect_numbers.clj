(ns perfect-numbers)

(defn- divisors [n]
  (filter #(zero? (rem n %)) (range 1 (inc (quot n 2)))))

(defn classify [n]
  (when (neg? n) (throw (IllegalArgumentException. "number must be positive")))
  (let [aliquot-sum (apply + (divisors n))]
    (cond
      (> aliquot-sum n) :abundant
      (= aliquot-sum n) :perfect
      (< aliquot-sum n) :deficient)))
