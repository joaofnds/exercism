(ns word-count
  (:require [clojure.string :as str]))

(defn- string->words [s]
  (remove empty? (str/split (str/lower-case s) #"\W")))

(defn word-count [s]
  (reduce #(merge-with + %1 {%2 1}) {} (string->words s)))
