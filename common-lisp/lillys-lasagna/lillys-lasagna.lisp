(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defun expected-time-in-oven ()
  "returns how many minutes the lasagna should be in the oven."
  337)

(defun remaining-minutes-in-oven (elapsed)
  "returns how many minutes the lasagna still has to remain in the oven."
  (- (expected-time-in-oven) elapsed))

(defun preparation-time-in-minutes (number-of-layers)
  "returns how many minutes Lilly spent preparing the lasagna."
  (let ((time-for-each-layer 19))
    (* number-of-layers time-for-each-layer)))

(defun elapsed-time-in-minutes (number-of-layers elapsed)
  "returns how many minutes Lilly has worked on cooking the lasagna."
  (+ elapsed (preparation-time-in-minutes number-of-layers)))
