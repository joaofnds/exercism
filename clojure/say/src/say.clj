(ns say
  (:require [clojure.pprint :refer [cl-format]]
            [clojure.string :refer [replace]]))

(defn number [num]
  (if (>= 999999999999 num 0)
    (replace (cl-format nil "~R" num) "," "")
    (throw (IllegalArgumentException.))))
