(ns say
  (:require [clojure.string :refer [join]]))

;; (clojure.pprint/cl-format "~R" num)

(def units {0 "zero"
            1 "one"
            2 "two"
            3 "three"
            4 "four"
            5 "five"
            6 "six"
            7 "seven"
            8 "eight"
            9 "nine"
            10 "ten"
            11 "eleven"
            12 "twelve"
            13 "thirteen"
            14 "fourteen"
            15 "fifteen"
            16 "sixteen"
            17 "seventeen"
            18 "eighteen"
            19 "nineteen"
            20 "twenty"
            30 "thirty"
            40 "forty"
            50 "fifty"
            60 "sixty"
            70 "seventy"
            80 "eighty"
            90 "ninety"})

(defn- divisible-by? [num by]
  (pos? (quot num by)))

(defn- number-less-than-100 [num]
  (let [tens (quot num 10)
        ones (rem num 10)]
    (if (< num 20)
      (units num)
      (join "-" (cond-> []
                  (pos? tens) (conj (units (* 10 tens)))
                  (pos? ones) (conj (units ones)))))))

(defn number [num]
  (when-not (>= 999999999999 num 0)
    (throw (IllegalArgumentException. "out of range")))
  (loop [n num result []]
    (cond
      (zero? num) "zero"
      (zero? n) (join " " result)
      (divisible-by? n 1000000000) (recur (mod n 1000000000) (conj result (str (number (quot n 1000000000)) " billion")))
      (divisible-by? n 1000000)    (recur (mod n 1000000)    (conj result (str (number (quot n 1000000)) " million")))
      (divisible-by? n 1000)       (recur (mod n 1000)       (conj result (str (number (quot n 1000)) " thousand")))
      (divisible-by? n 100)        (recur (mod n 100)        (conj result (str (units (quot n 100)) " hundred")))
      :else (join " " (conj result (number-less-than-100 n))))))
