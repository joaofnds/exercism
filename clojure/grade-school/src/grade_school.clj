(ns grade-school)

(defn grade [school grade]
  (get school grade []))

(defn add [school name grade]
  (update school grade (fnil conj []) name))

(defn sorted [school]
  (into (sorted-map) (map #(update % 1 sort) school)))
