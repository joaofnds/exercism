(ns isogram
  (:require [clojure.string :refer [lower-case]]))

(defn isogram? [a-string]
  (->> (lower-case a-string)
       (re-seq #"\p{L}")
       frequencies
       (every? #(= 1 (second %)))))
