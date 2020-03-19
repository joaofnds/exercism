(ns reverse-string)

(defn reverse-string [s]
  "Reverse a string."
  (apply str (reverse s)))

;; A couple other ways you could go about solving this problem
; (apply str (into () s))
; (reduce #(str %2 %1) "" s)
