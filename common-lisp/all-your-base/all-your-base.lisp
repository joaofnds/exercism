(in-package #:cl-user)
(defpackage #:all-your-base
  (:use #:common-lisp)
  (:export #:rebase))

(in-package #:all-your-base)

(defun to-base-10 (digits base)
  (loop :for digit :in digits
        :and i :downfrom (1- (length digits))
        :summing (* digit (expt base i))))

(defun from-base-10 (number base)
  (loop :for n := number :then (floor n base)
        :while (> n 0)
        :collect (rem n base) :into digits
        :finally (return (nreverse (or digits '(0))))))

(defun valid-params (list-digits in-base out-base)
  (and (> in-base 1)
       (> out-base 1)
       (every #'(lambda (n) (> in-base n -1)) list-digits)))

(defun rebase (list-digits in-base out-base)
  (when (valid-params list-digits in-base out-base)
    (from-base-10 (to-base-10 list-digits in-base) out-base)))
