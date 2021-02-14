(ns grade-school)

(defn grade [school grade]
  (get school grade []))

(defn add [school name grade]
  (if (contains? school grade)
    (update school grade conj name)
    (assoc school grade [name])))

(defn sorted [school]
  (into (sorted-map) (map #(update % 1 sort) school)))
