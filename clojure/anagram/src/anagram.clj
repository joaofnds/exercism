(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn- anagram? [word candidate]
  (let [lower-word (lower-case word)
        lower-candidate (lower-case candidate)]
    (and
     (not= lower-word lower-candidate)
     (= (frequencies lower-word) (frequencies lower-candidate)))))

(defn anagrams-for [word prospect-list]
  (filter (partial anagram? word) prospect-list))
