(ns armstrong-numbers)

(def expt #(reduce * (repeat %1 %2)))
(def char->int #(js/parseInt % 10))
(def split-digits #(map char->int (str %)))

(defn armstrong? [num]
  (let [digits (split-digits num)
        length (count digits)]
    (->>
     digits
     (map #(expt length %)) ;; raise each digit to "length"
     (apply +)              ;; sum them to get the armstrong-sum
     (= num))))             ;; check if armstrong-sum == number
