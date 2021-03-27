(ns isbn-verifier)

(defn number? [s]
  (not (js/isNaN (js/Number s))))

(defn- divisible-by? [divisor dividend]
  (zero? (mod dividend divisor)))

(defn- weighted-sum [nums weights]
  (reduce + (map * nums weights)))

(defn- isbn-format? [isbn]
  (boolean (re-matches #"(?:\d-?){9}[\dX]" isbn)))

(defn isbn->num [isbn-digit]
  (cond (number? isbn-digit) (js/Number isbn-digit)
        (= isbn-digit \X) 10))

(defn- isbn->nums [isbn]
  (keep isbn->num isbn))

(defn- nums->isbn [nums]
  (apply str (map #(if (= % 10) \X (str %)) nums)))

(defn- checksum? [nums]
  (->> (weighted-sum nums (range 10 0 -1))
       (divisible-by? 11)))

(defn- checksum13 [nums]
  (let [sum (weighted-sum nums (cycle [1 3]))]
    (- 10 (mod sum 10))))

(defn isbn? [isbn]
  (and (isbn-format? isbn) (checksum? (isbn->nums isbn))))

(defn isbn10->isbn13 [isbn10]
  (let [nums (into [9 7 8] (drop-last (isbn->nums isbn10)))]
    (nums->isbn (conj nums (checksum13 nums)))))
