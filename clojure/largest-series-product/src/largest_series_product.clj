(ns largest-series-product)

(defn largest-product [span numeric-string]
  (cond
    (neg? span) (throw (Exception. "cannot compute negative span"))
    (zero? span) 1
    (zero? (count numeric-string)) (throw (Exception. "Cannor compute empty span for non-empty strings"))
    :else (let [numbers (map #(Integer/parseInt (str %)) numeric-string)]
            (->> numbers
                 (partition span 1)
                 (map #(reduce * 1 %))
                 (reduce max)))))
