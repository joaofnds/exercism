(ns armstrong-numbers)

(def expt #(reduce * (repeat %1 %2)))
(def parse-int #(Integer/parseInt %))
(def split-digits #(map (comp parse-int str) (str %)))

(defn armstrong? [num]
  (let [digits (split-digits num)
        len (count digits)
        armstrong-sum (reduce + (map (partial expt len) digits))]
    (= num armstrong-sum)))
