(defpackage #:collatz-conjecture
  (:use #:common-lisp)
  (:export #:collatz))

(in-package #:collatz-conjecture)

(defun collatz-of (n)
  (if (evenp n)
      (/ n 2)
      (1+ (* n 3))))

(defun collatz (first)
  (when (plusp first)
    (loop :for n := first :then (collatz-of n)
          :until (= n 1)
          :counting t)))
