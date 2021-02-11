(ns kindergarten-garden
  (:require [clojure.string :as str]))

(def students ["alice" "bob" "charlie" "david" "eve" "fred" "ginny" "harriet" "ileana" "joseph" "kincaid" "larry"])

(defn char->flower [c]
  (case c
    \R :radishes
    \C :clover
    \G :grass
    \V :violets))

(defn string->flowers [string]
  (map #(map char->flower %) (str/split-lines string)))

(defn students->keys [students]
  (sort (map (comp keyword str/lower-case) students)))

(defn garden
  ([string] (garden string students))
  ([string students] (->> (string->flowers string)
                          (map #(partition 2 %))
                          (apply map concat)
                          (zipmap (students->keys students)))))
