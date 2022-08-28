(defpackage :largest-series-product
  (:use :cl)
  (:export :largest-product))

(in-package :largest-series-product)

(defun largest-product (digits span)
  (when (and (<= 0 span (length digits)) (every #'digit-char-p digits))
    (loop :for i :upto (- (length digits) span)
          :for series := (subseq digits i (+ i span))
          :for product := (apply #'* (map 'list #'digit-char-p series))
          :maximize product)))
