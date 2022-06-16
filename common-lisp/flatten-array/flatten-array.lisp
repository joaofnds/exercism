(defpackage :flatten-array
  (:use :cl)
  (:export :flatten))

(in-package :flatten-array)

(defun flatten (nested)
  (when nested
    (if (listp (car nested))
        (flatten (append (car nested) (cdr nested)))
        (cons (car nested) (flatten (cdr nested))))))
