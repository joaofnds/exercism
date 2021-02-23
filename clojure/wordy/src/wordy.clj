(ns wordy
  (:require [clojure.string :as str]))

(defn- operation [string]
  (case (re-find #"plus|minus|divided|multiplied" string)
    "plus" +
    "minus" -
    "divided" /
    "multiplied" *
    (throw (IllegalArgumentException.))))

(defn- operators [string]
  (map read-string (re-seq #"-?\d+" string)))

(defn- operations [string]
  (conj (mapv operation ((comp drop-last rest) (str/split (str/lower-case string) #"\d+"))) nil))

(defn- parse [string]
  (let [ops (operations string)
        [x & xs] (operators string)]
    (cons x (interleave ops xs))))

(defn evaluate [string]
  (let [[x & xs] (parse string)]
    (when (empty? xs) (throw (IllegalArgumentException.)))
    (reduce (fn [a [f b]] (f a b))
            x
            (partition 2 xs))))
