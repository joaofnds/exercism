(ns clock)

(defn clock->string [c]
  (format "%02d:%02d" (quot c 60) (mod c 60)))

(defn clock [h m]
  (mod (+ (* 60 h) m) 1440))

(defn add-time [c minutes]
  (clock 0 (+ c minutes)))
