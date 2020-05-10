(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn- isbn-schema? [isbn]
  (re-matches #"(?:\d-?){9}[\dX]" isbn))

(defn- isbn-code-to-values
  [code]
  (map
   #(if (= % \X) 10 (Character/digit % 10))
   (str/replace code "-" "")))

(defn- isbn-sum [isbn-values]
  (apply + (map-indexed #(* %2 (- 10 %1)) isbn-values)))

(defn- valid-isbn-sum? [sum]
  (zero? (mod sum 11)))

(defn isbn? [isbn]
  (if (isbn-schema? isbn)
    (->> isbn
         isbn-code-to-values
         isbn-sum
         valid-isbn-sum?)
    false))

(isbn? "3-598-21508-8")
