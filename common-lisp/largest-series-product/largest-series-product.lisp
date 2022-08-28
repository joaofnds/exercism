(defpackage :largest-series-product
  (:use :cl)
  (:export :largest-product))

(in-package :largest-series-product)

(defun partition (seq size)
  (loop :for i :to (- (length seq) size)
        :collect (subseq seq i (+ i size))))

(defun largest-product (str span)
  (let ((digits (map 'list #'digit-char-p str)))
    (cond
      ((zerop span) 1)
      ((minusp span) nil)
      ((< (length digits) span) nil)
      ((some #'null digits) nil)
      (t (loop :for series :in (partition digits span)
               :maximize (apply '* series))))))
