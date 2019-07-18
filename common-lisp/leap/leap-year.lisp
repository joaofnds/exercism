(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun remainder-zerop (dividend divisor)
  (zerop (rem dividend divisor)))

(defun leap-year-p (year)
  (and (remainder-zerop year 4)
       (or (not (remainder-zerop year 100))
           (remainder-zerop year 400))))
