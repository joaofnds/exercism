(ns scrabble-score
  (:require [clojure.string :refer [lower-case]]))

(defn score-letter [letter]
  (case (lower-case letter)
    ("a" "e" "i" "l" "n" "o" "r" "s" "t" "u") 1
    ("d" "g") 2
    ("b" "c" "m" "p") 3
    ("f" "h" "v" "w" "y") 4
    "k" 5
    ("j" "x") 8
    ("q" "z") 10
    :else 0))

(defn score-word [word]
  (reduce + (map score-letter word)))
