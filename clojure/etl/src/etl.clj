(ns etl)

(defn transform-score
  [value words]
  (reduce
   #(merge %1 {(.toLowerCase %2) value})
   {}
   words))

(defn transform
  [source]
  (reduce
   (fn [col [value words]]
     (merge col (transform-score value words)))
   {}
   source))
