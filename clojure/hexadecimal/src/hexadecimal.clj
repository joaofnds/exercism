(ns hexadecimal)

(defn pow [a b]
  (reduce * 1 (repeat b a)))

(defn valid-binary-number [binary-number-as-string]
  (re-matches #"[0-9a-f]+" binary-number-as-string))

(defn hex-digit-to-int [binary-char]
  ({\0 0 \1 1 \2 2  \3 3  \4 4  \5 5  \6 6  \7 7
    \8 8 \9 9 \a 10 \b 11 \c 12 \d 13 \e 14 \f 15} binary-char))

(defn hex-to-int [num-str]
  (if (valid-binary-number num-str)
    (->> num-str
         (map hex-digit-to-int)
         reverse
         (map-indexed #(* %2 (pow 16 %1)))
         (apply +))
    0))
