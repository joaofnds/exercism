(ns say
  (:require [clojure.string :refer [trim blank? join]]))

;; (clojure.pprint/cl-format "~R" num)

(def units-through-20 ["zero" "one" "two" "three" "four"
                       "five" "six" "seven" "eight" "nine"
                       "ten" "eleven" "twelve" "thirteen" "fourteen"
                       "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"
                       "twenty"])

(def units-tens ["zero" "ten" "twenty" "thirty" "forty"
                 "fifty" "sixty" "seventy" "eighty" "ninety"])

(def group-names ["" "thousand" "million" "billion"])

(defn- number-less-than-100 [num]
  (let [tens (quot num 10)
        ones (rem num 10)]
    (if (< num 20)
      (units-through-20 num)
      (cond-> []
        (pos? tens) (conj (units-tens tens))
        (pos? ones) (conj (units-through-20 ones))
        :always (as-> tens-and-ones (join "-" tens-and-ones))))))

(defn- number-greater-than-100 [num]
  (let [hundreds (quot num 100)
        remainder (rem num 100)
        hundreds-number (number-less-than-100 hundreds)
        remainder-number (number-less-than-100 remainder)]
    (cond
      (and (pos? hundreds) (pos? remainder)) (str hundreds-number " hundred " remainder-number)
      (pos? hundreds) (str hundreds-number " hundred")
      (pos? remainder) remainder-number)))

(defn- group-number [num]
  (cond
    (>= num 100) (number-greater-than-100 num)
    (pos? num) (number-less-than-100 num)
    (zero? num) nil))

(defn- last-three-digits [num]
  (rem num 1000))

(defn- up-to-last-three-digits [num]
  (quot num 1000))

(defn- reject [pred coll]
  (filter (complement pred) coll))

(defn- add-group-names [groups]
  (->> groups
       reverse
       (interleave group-names)
       reverse
       (partition 2)
       (reject #(nil? (first %)))
       flatten))

(defn- join-groups [groups]
  (->> groups
       (join " ")
       trim))

(defn- grouped-numbers [num]
  (loop [remainder (up-to-last-three-digits num)
         group (last-three-digits num)
         groups (list)]
    (if (zero? remainder)
      (conj groups group)
      (recur (up-to-last-three-digits remainder)
             (last-three-digits remainder)
             (conj groups group)))))
(defn- zero-if-empty [str]
  (if (blank? str)
    "zero"
    str))

(defn number [num]
  (when-not (>= 999999999999 num 0)
    (throw (IllegalArgumentException. "out of range")))
  (->> (grouped-numbers num)
       (map group-number)
       add-group-names
       join-groups
       zero-if-empty))
