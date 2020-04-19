(ns etl)

(defn transform-score [[score words]]
  (map #(vector (.toLowerCase %) score) words))

(defn transform [source]
  (into {} (mapcat transform-score source)))
