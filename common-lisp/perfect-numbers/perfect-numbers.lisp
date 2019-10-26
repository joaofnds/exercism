(defpackage #:perfect-numbers
  (:use #:common-lisp)
  (:export #:classify))

(in-package #:perfect-numbers)

(defun factors-sum (number)
  (loop :for i :from 1 :to (floor number 2)
        :when (zerop (rem number i))
          :sum i))

(defun classify (number)
  (when (> number 0)
    (let ((aliquot (factors-sum number)))
      (cond ((> aliquot number) "abundant")
            ((= aliquot number) "perfect")
            ((< aliquot number) "deficient")))))
