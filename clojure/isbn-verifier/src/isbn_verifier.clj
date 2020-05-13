(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn- isbn-schema? [isbn]
  (re-matches #"(?:\d-?){9}[\dX]" isbn))

(defn isbn->num [isbn-digit]
  (cond (Character/isDigit isbn-digit) (- (long isbn-digit) 48)
        (= isbn-digit \X) 10))

(defn- isbn->nums [isbn]
  (keep isbn->num isbn))

(defn- divisible-by? [divisor dividend]
  (zero? (mod dividend divisor)))

(defn- checksum? [nums]
  (->> (map * nums (range 10 0 -1))
       (reduce +)
       (divisible-by? 11)))

(defn isbn? [isbn]
  (if (isbn-schema? isbn)
    (checksum? (isbn->nums isbn))
    false))
