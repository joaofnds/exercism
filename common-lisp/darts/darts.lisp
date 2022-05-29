(defpackage :darts
  (:use :cl)
  (:export :score))

(in-package :darts)

(defun score (x y)
  (let ((distance (sqrt (+ (* x x) (* y y)))))
    (cond
      ((>= 1 distance) 10)
      ((>= 5 distance) 5)
      ((>= 10 distance) 1)
      (t 0))))
