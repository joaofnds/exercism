(ns leap)

(defn divisible-by? [div num]
  (zero? (rem num div)))

(defn leap-year? [year]
  (condp divisible-by? year
    400 true
    100 false
    4   true
    false))
