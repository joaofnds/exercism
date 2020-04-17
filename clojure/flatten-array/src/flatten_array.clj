(ns flatten-array)

(defn flatten [[head & tail]]
  (cond
    (nil? head) []
    (vector? head) (concat (flatten head) (flatten tail))
    :else (concat [head] (flatten tail))))
