(ns strain)

(defn retain [predicate collection]
  (reduce
   (fn [memo item]
     (if (predicate item)
       (conj memo item)
       memo))
   []
   collection))

(defn discard [predicate collection]
  (retain (complement predicate) collection))
