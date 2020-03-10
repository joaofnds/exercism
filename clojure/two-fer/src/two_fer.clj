(ns two-fer)

(defn two-fer
  "Two-fer is short for two for one. One for you and one for me."
  ([] (two-fer "you"))
  ([name] (str "One for " name ", one for me.")))
