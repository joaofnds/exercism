(ns isbn-verifier)

(defn- divisible-by? [divisor dividend]
  (zero? (mod dividend divisor)))

(defn- weighted-sum [nums weights]
  (reduce + (map * nums weights)))

(defn- isbn-format? [isbn]
  "Checks if the given string has a valid ISBN10 format"
  (boolean (re-matches #"(?:\d-?){9}[\dX]" isbn)))

(defn isbn->num [isbn-digit]
  "Given an ISBN digit, return its value"
  (cond (Character/isDigit isbn-digit) (- (long isbn-digit) 48)
        (= isbn-digit \X) 10))

(defn- isbn->nums [isbn]
  "Given an ISBN string, return its values"
  (keep isbn->num isbn))

(defn- nums->isbn [nums]
  "Formats a seq of numbers into an ISBN string."
  (apply str (map #(if (= % 10) \X (str %)) nums)))

(defn- checksum? [nums]
  "Validate the given ISBN10 values"
  (->> (weighted-sum nums (range 10 0 -1))
       (divisible-by? 11)))

(defn- checksum13 [nums]
  "Calculates the checksum digit of the given ISBN13 values"
  (let [sum (weighted-sum nums (cycle [1 3]))]
    (- 10 (mod sum 10))))

(defn isbn? [isbn]
  "Checks if the given isbn is a valid ISBN 10"
  (and (isbn-format? isbn) (checksum? (isbn->nums isbn))))

(defn isbn10->isbn13 [isbn10]
  "Converts the given ISBN10 string to ISBN13"
  (let [nums (into [9 7 8] (drop-last (isbn->nums isbn10)))]
    (nums->isbn (conj nums (checksum13 nums)))))
