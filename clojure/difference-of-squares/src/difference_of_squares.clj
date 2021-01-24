(ns difference-of-squares)

(defn- square [n]
  (* n n))

(defn sum-of-squares [n]
  (reduce + (map square (range (inc n)))))

(defn square-of-sum [n]
  (square (reduce + (range (inc n)))))

(defn difference [n]
  (- (square-of-sum n) (sum-of-squares n)))
