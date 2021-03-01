(ns largest-series-product)

(defn largest-product [span numeric-string]
  {:pre [(<= 0 span (count numeric-string)) (re-matches #"\d*" numeric-string)]}
  (if (zero? span) 1
      (->> numeric-string
           (map #(Character/digit % 10))
           (partition span 1)
           (map #(apply * %))
           (apply max))))
