(ns nth-prime)

(defn primes [i p]
  (if (some #(zero? (mod i %)) p)
    (recur (inc i) p)
    (cons i (lazy-seq (primes (inc i) (conj p i))))))

(defn nth-prime [n]
  (when-not (pos? n) (throw (IllegalArgumentException.)))
  (last (take n (primes 2 []))))
