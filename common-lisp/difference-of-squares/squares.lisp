(defpackage #:squares
  (:use #:cl)
  (:export #:sum-of-squares
           #:square-of-sum
           #:difference))

(in-package #:squares)


(defun sum-of-squares (n)
  (+ (* n n n 1/3) (* n n 1/2) (* n 1/6)))

(defun square-of-sum (n)
  (expt (* (/ n 2) (1+ n)) 2))

(defun difference (n)
  (- (square-of-sum n) (sum-of-squares n)))
