(ns acronym
  (:require [clojure.string :as str]))

(defn acronym [phrase]
  (->> (str \space phrase)
       (re-seq #"(?:\b(\w)|[a-z]([A-Z]))")
       (map (fn [[_ match1 match2]] (or match1 match2)))
       str/join
       str/upper-case))
