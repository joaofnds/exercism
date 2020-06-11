(ns raindrops)

(defn- divisible-by? [divisor dividend]
  (zero? (mod dividend divisor)))

(def factor-of-3? (partial divisible-by? 3))
(def factor-of-5? (partial divisible-by? 5))
(def factor-of-7? (partial divisible-by? 7))

(defn- factor->word [factor]
  (case factor
    3 "Pling"
    5 "Plang"
    7 "Plong"))

(defn- splatter [n]
  (with-out-str
    (when (factor-of-3? n)
      (print (factor->word 3)))
    (when (factor-of-5? n)
      (print (factor->word 5)))
    (when (factor-of-7? n)
      (print (factor->word 7)))))

(defn convert [n]
  (let [sound (splatter n)]
    (if (empty? sound)
      (str n)
      sound)))
