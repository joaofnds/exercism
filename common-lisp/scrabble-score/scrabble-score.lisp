(defpackage #:scrabble-score
  (:use #:cl)
  (:export #:score-word))

(in-package #:scrabble-score)

(defun letter-score (letter)
  (case (char-downcase letter)
    ((#\a #\e #\i #\l #\n #\o #\r #\s #\t #\u) 1)
    ((#\d #\g) 2)
    ((#\b #\c #\m #\p) 3)
    ((#\f #\h #\v #\w #\y) 4)
    ((#\k) 5)
    ((#\j #\x) 8)
    ((#\q #\z) 10)
    (otherwise 0)))

(defun score-word (word)
  (reduce #'+ word :key #'letter-score))
