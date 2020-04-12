(ns run-length-encoding)

(defn- decode
  [n letter]
  (let [n (Integer/parseInt (or n "1"))]
    (repeat n letter)))

(defn- encode
  [[char :as letters]]
  (let [length (count letters)]
    (if (= 1 length)
      (str char)
      (str length char))))

(defn run-length-encode
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (map encode)
       (apply str)))

(defn run-length-decode
  [cipher-text]
  (->> cipher-text
       (re-seq #"(\d+)?(\D)")
       (mapcat #(apply decode (rest %)))
       (apply str)))
