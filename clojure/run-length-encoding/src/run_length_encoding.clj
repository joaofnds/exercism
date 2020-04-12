(ns run-length-encoding)

(defn- letter-count
  [seq]
  (let [len (count seq)]
    (if (> len 1) len "")))

(defn run-length-encode
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (mapcat (juxt letter-count first))
       (apply str)))

(defn run-length-decode
  [cipher-text]
  (->> cipher-text
       (re-seq #"(\d+)?(\D)")
       (mapcat (fn [[_ n char]]
                 (repeat (Integer/parseInt (or n "1")) char)))
       (apply str)))
