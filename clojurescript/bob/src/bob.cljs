(ns bob
  (:require [clojure.string :as str]))

(defn- silence? [s]
  (str/blank? s))

(defn- letter? [s]
  (re-find #"[a-zA-Z]" s))

(defn- shout? [s]
  (and (letter? s)
       (= (str/upper-case s) s)))

(defn- question? [s]
  (str/ends-with? s "?"))

(defn response-for [s]
  (let [s (str/trim s)]
    (cond
      (silence? s) "Fine. Be that way!"
      (and (shout? s) (question? s)) "Calm down, I know what I'm doing!"
      (shout? s) "Whoa, chill out!"
      (question? s) "Sure."
      :else "Whatever.")))
