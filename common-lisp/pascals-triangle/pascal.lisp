(in-package #:cl-user)
(defpackage #:pascal
  (:use #:cl)
  (:export #:rows))
(in-package #:pascal)

(defun rows (n)
  (loop :for i :below n
        :for prev := row
        :for row := (loop :for j :upto i
                          :for a := b
                          :for b := (nth j prev)
                          :collect (if (and a b) (+ a b) 1))
        :collect row))
