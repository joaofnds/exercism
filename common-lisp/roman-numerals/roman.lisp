(defpackage #:roman
  (:use #:cl)
  (:export #:romanize))

(in-package #:roman)

(defparameter *value-roman* '((1000 . "M") (900 . "CM") (500 . "D") (400 . "CD")
                              (100 . "C") (90 . "XC") (50 . "L") (40 . "XL")
                              (10 . "X") (9 . "IX") (5 . "V") (4 . "IV") (1 . "I")))

;; (defun romanize (n)
;;   (format nil "~@r" n)) ¯\_(ツ)_/¯

(defun romanize (number)
  (apply #'concatenate 'string
         (loop :for (value . roman-literal) := (assoc number *value-roman* :test #'>=)
               :while value
               :do (decf number value)
               :collect roman-literal)))
