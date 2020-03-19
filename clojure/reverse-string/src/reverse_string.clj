(ns reverse-string)

(defn reverse-string [s]
  "Reverse a string."
  (apply str (reverse s)))
