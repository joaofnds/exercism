(ns phone-number
  (:require [clojure.string :as string]))

(defn- left-pad-1 [num-str]
  (if (= 10 (count num-str))
    (str "1" num-str)
    num-str))

(defn- zeros-if-blank [num-str]
  (if (string/blank? num-str)
    "0000000000"
    num-str))

(defn- clean-number [num-str]
  (->> num-str
       (re-seq #"\d+")
       string/join
       left-pad-1))

(defn- groups [clean-number-str]
  (->> clean-number-str
       (re-seq #"^1?(\d{3})(\d{3})(\d{4})$")
       first
       rest))

(defn number [num-str]
  (->> num-str
       clean-number
       groups
       string/join
       zeros-if-blank))

(defn area-code [num-string]
  (->> num-string
       clean-number
       groups
       first))

(defn pretty-print [num-str]
  (let [[area local number] (groups (clean-number num-str))]
    (str "(" area ") " local "-" number)))
