(ns clock
  (:require [clojure.pprint :refer [cl-format]]))

(defn clock->string [c]
  (cl-format nil "~2,'0D:~2,'0D" (quot c 60) (mod c 60)))

(defn clock [h m]
  (mod (+ (* 60 h) m) 1440))

(defn add-time [c minutes]
  (clock 0 (+ c minutes)))
