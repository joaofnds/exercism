(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun double-n (n)
  (* 2 n))

(defun square (n)
  (* n n))

(defun square-minus-n (n)
  (- (square n) n))

(defun more-than-20 (n)
  (> 20 n))

(defun make-magnificent-maybe (f numbers)
  (map 'list f numbers))

(defun only-the-best (f numbers)
  (remove-if f (remove 1 numbers)))
