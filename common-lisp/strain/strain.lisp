(defpackage #:strain
  (:use #:common-lisp)
  (:export #:keep #:discard))

(in-package #:strain)

(defun keep (predicate seq)
  (loop :for item :in seq
        :when (funcall predicate item)
          :collect item))

(defun discard (predicate seq)
  (keep (complement predicate) seq))
