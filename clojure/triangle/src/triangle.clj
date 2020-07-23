(ns triangle)

(defn illogical? [a b c]
  (or (>= a (+ b c))
      (>= b (+ a c))
      (>= c (+ a b))))

(def is-valid? (complement illogical?))

(defn equilateral? [& sides]
  (and (apply is-valid? sides)
       (= 1 (count (distinct sides)))))

(defn isosceles? [& sides]
  (and (apply is-valid? sides)
       (>= 2 (count (distinct sides)))))

(defn scalene? [& sides]
  (and (apply is-valid? sides)
       (= 3 (count (distinct sides)))))
