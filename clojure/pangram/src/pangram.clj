(ns pangram
  (:require [clojure.string :as str]))

(defn pangram? [string]
  (->> (str/lower-case string)
       (re-seq #"[a-z]")
       distinct
       count
       (== 26)))
