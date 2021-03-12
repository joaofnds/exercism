(ns series
  (:require [clojure.string :refer [join]]))

(defn slices [string length]
  (if (zero? length)
    [""]
    (map join (partition length 1 string))))
