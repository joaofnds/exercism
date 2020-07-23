(ns binary)

(defn pow [a b]
  (reduce * 1 (repeat b a)))

(defn valid-binary-number [binary-number-as-string]
  (re-matches #"[01]+" binary-number-as-string))

(defn binary-char-to-number [binary-char]
  ({\0 0 \1 1} binary-char))

(defn to-decimal [num-str]
  (if (valid-binary-number num-str)
    (->> num-str
         (map binary-char-to-number)
         reverse
         (map-indexed #(* %2 (pow 2 %1)))
         (apply +))
    0))
