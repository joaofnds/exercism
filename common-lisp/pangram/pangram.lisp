(defpackage :pangram
  (:use :cl)
  (:export :pangramp))

(in-package :pangram)

(defun pangramp (sentence)
  (= 26 (length (remove-duplicates (string-downcase (remove-if-not #'alpha-char-p sentence))))))
