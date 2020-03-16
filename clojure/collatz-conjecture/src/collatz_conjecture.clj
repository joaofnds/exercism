(ns collatz-conjecture)

(defn next-term [n]
  (if (zero? (rem n 2))
    (/ n 2)
    (+ 1 (* n 3))))

(defn collatz
  ([n] (collatz n 0))
  ([n steps]
   (if (= 1 n)
     steps
     (collatz (next-term n) (inc steps)))))
