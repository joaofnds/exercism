(defpackage #:prime-factors
  (:use #:common-lisp)
  (:export :factors-of))

(in-package #:prime-factors)

(defun factors-of (number)
  (loop :with n := number :and i := 2
        :for div := (/ n i)
        :while (>= n i)
        :if (integerp div)
          :do (setf n div)
          :and :collect i
        :else
          :do (incf i)))
