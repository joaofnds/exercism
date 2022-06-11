(defpackage :sum-of-multiples
  (:use :cl)
  (:export :sum))

(in-package :sum-of-multiples)

(defun sum (factors limit)
  (loop :for n :from 1 :below limit
        :when (divisible-by-any? n factors)
          :sum n))

(defun divisible-by-any? (n divs)
  (some (lambda (div) (divisible-by? n div)) divs))

(defun divisible-by? (a b)
  (when (not (zerop b))
    (zerop (rem a b))))
