(ns isogram
  (:require [clojure.string :refer [lower-case]]))

(defn isogram? [word]
  (->> (lower-case word)
       (remove #{\- \space})
       (apply distinct?)))
