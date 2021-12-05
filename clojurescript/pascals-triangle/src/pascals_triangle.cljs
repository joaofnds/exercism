(ns pascals-triangle)

(defn step [row]
  (flatten [1 (map + row (rest row)) 1]))

(def triangle
  (iterate step [1]))

(defn row [n]
  (nth triangle (dec n)))
