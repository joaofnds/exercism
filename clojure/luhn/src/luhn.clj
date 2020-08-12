(ns luhn)

(defn- luhn-double [n]
  (if (> n 4)
    (- (* 2 n) 9)
    (* 2 n)))

(defn- parse-digit [s]
  (try
    (Integer/parseInt (str s))
    (catch Exception _ nil)))

(defn- luhn-sum [numbers]
  (apply + (map-indexed
            #(if (odd? %1) (luhn-double %2) %2)
            numbers)))

(defn- keep-digits [digits]
  (keep parse-digit digits))

(defn- valid-input? [digits]
  (->> digits
       (re-matches #"(?<![a-z])[\d\s]+")
       (remove #(= \space %))
       count
       (< 1)))

(defn valid? [digits]
  (if (valid-input? digits)
    (-> digits
        keep-digits
        reverse
        luhn-sum
        (mod 10)
        zero?)
    false))
