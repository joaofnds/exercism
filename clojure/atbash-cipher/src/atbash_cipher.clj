(ns atbash-cipher
  (:require [clojure.string :as str]))

(def cifer "zyxwvutsrqponmlkjihgfedcba")

(defn encode-char [c]
  (let [code (- (int c) 97)]
    (if (<= 0 code 25)
      (.charAt cifer code)
      c)))

(defn encode [plain]
  (->> plain
       str/lower-case
       (re-seq #"[a-z0-9]")
       (apply str)
       (map encode-char)
       (partition-all 5)
       (map str/join)
       (str/join \space)))
