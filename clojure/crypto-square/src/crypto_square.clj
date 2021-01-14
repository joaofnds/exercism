(ns crypto-square
  (:require [clojure.string :as str]))

(defn- pad-right [s to-size]
  (apply str s (repeat (- to-size (count s)) \space)))

(defn- transpose [m]
  (apply map (comp str/join list) m))

(defn rotate-segments [segments]
  (let [max-size (apply max (map count segments))]
    (->> segments
         (map #(pad-right % max-size))
         transpose
         (map str/trim))))

(defn normalize-plaintext [plaintext]
  (-> plaintext
      str/lower-case
      (str/replace #"[^a-z0-9]*" "")))

(defn square-size [text]
  (int (Math/ceil (Math/sqrt (count text)))))

(defn plaintext-segments [text]
  (let [text (normalize-plaintext text)
        size (square-size text)]
    (map str/join (partition-all size text))))

(defn normalize-ciphertext [text]
  (->> text
       plaintext-segments
       rotate-segments
       (str/join " ")))

(defn ciphertext [text]
  (str/replace (normalize-ciphertext text) " " ""))
