(ns queen-attack
  (:require [clojure.string :as str]))

(defn board-string [{:keys [w b]}]
  (-> (vec (repeat 8 (vec (repeat 8 "_"))))
      (#(if w (assoc-in % w "W") %))
      (#(if b (assoc-in % b "B") %))
      (->> (map #(str/join " " %))
           (str/join "\n"))))

(defn can-attack [{:keys [w b]}]
  (let [[wy wx] w
        [by bx] b]
    (.contains
     [0 45 90 135 180]
     (int (Math/abs (Math/toDegrees (Math/atan2 (- wy by) (- wx bx))))))))
