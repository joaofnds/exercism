(ns octal)

(defn pow [a b]
  (reduce * 1 (repeat b a)))

(defn valid-octal-number [trinary-number-as-string]
  (re-matches #"[0-7]+" trinary-number-as-string))

(defn octal-char-to-number [octal-char]
  ({\0 0 \1 1 \2 2 \3 3 \4 4 \5 5 \6 6 \7 7} octal-char))

(defn to-decimal [num-str]
  (if (valid-octal-number num-str)
    (->> num-str
         (map octal-char-to-number)
         reverse
         (map-indexed #(* %2 (pow 8 %1)))
         (apply +))
    0))
