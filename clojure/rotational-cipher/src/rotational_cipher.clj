(ns rotational-cipher
  (:require [clojure.string :as str]))

(def a "abcdefghijklmnopqrstuvwxyz")
(def A (str/upper-case a))

(defn- rot [n]
  (let [n (mod n (count a))
        r (zipmap a (drop n (cycle a)))
        R (zipmap A (drop n (cycle A)))]
    #((merge r R) % %)))

(defn rotate [s n]
  (apply str (map (rot n) s)))
