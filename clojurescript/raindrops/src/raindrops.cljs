(ns raindrops)

(defn- divisible-by? [divisor dividend]
  (zero? (mod dividend divisor)))

(def factor->word
  {3 "Pling"
   5 "Plang"
   7 "Plong"})

(defn- splatter [n]
  (with-out-str
    (doseq [factor [3 5 7]]
      (when (divisible-by? factor n)
        (print (factor->word factor))))))

(defn convert [n]
  (let [sound (splatter n)]
    (if (empty? sound)
      (str n)
      sound)))
