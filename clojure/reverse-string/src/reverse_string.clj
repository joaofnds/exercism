(ns reverse-string
  (:require [clojure.string :as str]))

(defn reverse-string [s]
  "Reverse a string."
  (str/reverse s))
