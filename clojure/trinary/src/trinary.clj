(ns trinary)

(defn pow [a b]
  (reduce * 1 (repeat b a)))


(defn valid-trinary-number [trinary-number-as-string]
  (re-matches #"[012]+" trinary-number-as-string))

(defn trinary-char-to-number [trinary-char]
  ({\0 0 \1 1 \2 2} trinary-char))

(defn to-decimal [num-str]
  (if (valid-trinary-number num-str)
    (->> num-str
         (map trinary-char-to-number)
         reverse
         (map-indexed #(* %2 (pow 3 %1)))
         (apply +))
    0))
