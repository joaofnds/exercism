(in-package #:cl-user)
(defpackage #:grains
  (:use #:cl)
  (:export :square :total))
(in-package #:grains)

(defun square (n)
  (ash 1 (1- n)))

(defun total ()
  (1- (square 65)))
