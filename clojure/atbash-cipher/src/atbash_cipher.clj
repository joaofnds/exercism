(ns atbash-cipher
  (:require [clojure.string :as str]))

(def cifer "zyxwvutsrqponmlkjihgfedcba")

(defn encode-char [c]
  (let [code (- (int c) 97)]
    (if (<= 0 code 25)
      (.charAt cifer code)
      c)))

(defn encode [plain]
  (->> (str/replace (str/lower-case plain) #"[^a-z0-9]" "")
       (map encode-char)
       (partition-all 5)
       (map str/join)
       (str/join \space)))
