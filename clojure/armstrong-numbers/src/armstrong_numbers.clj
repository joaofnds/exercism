(ns armstrong-numbers)

(defn expt
  [a b]
  (reduce * (repeat a b)))

(def parse-int #(Integer/parseInt %))

(defn armstrong? [num]
  (let [num_as_s (str num)
        len (count num_as_s)
        sum_of_digits (reduce + (map (comp (partial expt len) parse-int str) num_as_s))]
    (= num sum_of_digits)))
