(ns leap)

(defn divisible-by? [num div]
  (zero? (rem num div)))

(defn leap-year? [year]
  (cond
    (divisible-by? year 400) true
    (divisible-by? year 100) false
    (divisible-by? year 4) true
    :else false))
