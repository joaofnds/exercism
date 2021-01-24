(ns difference-of-squares)

(defn- square [n]
  (* n n))

(defn sum-of-squares [n]
  (reduce + (map square (range (inc n)))))

(defn square-of-sum [n]
  (square (reduce + (range (inc n)))))

(defn difference [n]
  (let [sum-square (sum-of-squares n)
        square-sum (square-of-sum n)]
    (- square-sum sum-square)))
