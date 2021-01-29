(ns sum-of-multiples)

(defn- divisible-by? [num div]
  (zero? (rem num div)))

(defn- divisible-by-some? [divs num]
  (some (partial divisible-by? num) divs))

(defn sum-of-multiples [divs max]
  (reduce + (filter (partial divisible-by-some? divs) (range max))))
