(ns roman-numerals)

(def value->roman
  '((1000 "M") (900 "CM") (500 "D") (400 "CD")
    (100  "C") (90  "XC") (50  "L") (40  "XL")
    (10   "X") (9   "IX") (5   "V") (4   "IV")
    (1    "I")))

(defn- closest-roman [n]
  (first (filter #(>= n (first %)) value->roman)))

(defn numerals [num]
  (loop [n num romans []]
    (let [[value roman] (closest-roman n)]
      (if (nil? value)
        (apply str romans)
        (recur (- n value) (conj romans roman))))))
