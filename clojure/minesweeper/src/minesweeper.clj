(ns minesweeper
  (:require [clojure.string :as str]))

(defn parse-board [board-str]
  (->> board-str str/split-lines (mapv (comp vec seq))))

(defn board->str [board]
  (->> board (map str/join) (str/join "\n")))

(def adjacents (juxt dec identity inc))

(defn neighbors [board [i j]]
  (for [r (adjacents i) c (adjacents j)]
    (get-in board [r c])))

(defn neighbors-count [board [x y]]
  (->> (neighbors board [x y])
       (keep #{\*})
       count
       (#(if (zero? %) " " (str %)))))

(defn map-matrix [f m]
  (map-indexed (fn [i row] (map-indexed (fn [j v] (f v [i j])) row)) m))

(defn count-mines [board]
  (map-matrix #(if (= \* %1) %1 (neighbors-count board %2)) board))

(defn draw [s]
  (-> s parse-board count-mines board->str))
