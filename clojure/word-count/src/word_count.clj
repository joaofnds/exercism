(ns word-count
  (:require [clojure.string :refer [lower-case]]))

(defn word-count [phrase]
  (->> (lower-case phrase)
       (re-seq #"\w+")
       frequencies))
