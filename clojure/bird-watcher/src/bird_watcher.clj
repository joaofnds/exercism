(ns bird-watcher)

(def last-week [0 2 5 3 7 8 4])
(def birds-per-day [])

(defn today [birds]
  (peek birds))

(defn inc-bird [birds]
  (update birds (dec (count birds)) inc))

(defn day-without-birds? [birds]
  (.contains birds 0))

(defn n-days-count [birds n]
  (apply + (take n birds)))

(defn busy-days [birds]
  (let [busy-day? #(> % 4)]
    (count (filter busy-day? birds))))

(defn odd-week? [birds]
  (= birds [1 0 1 0 1 0 1]))
