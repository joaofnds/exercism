(ns isbn-verifier)

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

(defn- adapt-isbn10-to-isbn13
  [isbn10]
  (->> isbn10
       drop-last
       (concat "978")
       isbn->nums))

(defn- isbn13-sum
  [isbn13-nums]
  (reduce + (map * isbn13-nums (flatten (repeat [1 3])))))

(defn- isbn13-checksum-digit
  [sum]
  (let [remainder (rem sum 10)]
    (if (zero? remainder)
      0
      (- 10 remainder))))

(defn- isbn13-with-checksum-digit
  [isbn13-without-checksum-digit]
  (->> isbn13-without-checksum-digit
       isbn13-sum
       isbn13-checksum-digit
       (conj (into [] isbn13-without-checksum-digit))
       (apply str)))

(defn isbn? [isbn]
  (if (isbn-schema? isbn)
    (checksum? (isbn->nums isbn))
    false))

(defn isbn10->isbn13
  [isbn10]
  (when (isbn? isbn10)
    (-> isbn10
        adapt-isbn10-to-isbn13
        isbn13-with-checksum-digit)))
