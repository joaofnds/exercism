(in-package #:cl-user)
(defpackage #:binary
  (:use #:common-lisp)
  (:export #:to-decimal))

(in-package #:binary)

(defun to-decimal (str)
  (flet ((binary-digit-p (d) (member d '(#\0 #\1))))
    (loop :with str := (remove-if-not #'binary-digit-p str)
          :for digit :across str
          :for i :downfrom (1- (length str))
          :for n := (digit-char-p digit)
          :sum (* n (expt 2 i)))))
