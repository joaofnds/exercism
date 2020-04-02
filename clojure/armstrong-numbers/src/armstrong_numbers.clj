(ns armstrong-numbers)

(def expt #(reduce * (repeat %1 %2)))
(def parse-int #(Integer/parseInt %))
(def split-digits #(map (comp parse-int str) (str %)))

(defn armstrong? [num]
  (let [digits (split-digits num)
        length (count digits)]
    (->>
     digits
     (map #(expt length %)) ;; raise each digit to "length"
     (reduce +)             ;; sum them to get the armstrong-sum
     (= num))))             ;; check if armstrong-sum == number
