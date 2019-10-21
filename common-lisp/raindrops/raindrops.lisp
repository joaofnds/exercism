(defpackage #:raindrops
  (:use #:common-lisp)
  (:export #:convert))

(in-package #:raindrops)

(defconstant +factor->word+
  '((3 . "Pling")
    (5 . "Plang")
    (7 . "Plong")))

(defun factor-words (n)
  (loop :for (factor . word) :in +factor->word+
        :when (zerop (mod n factor))
          :collect word))

(defun convert (n)
  (let ((words (factor-words n)))
    (if words
        (apply #'concatenate 'string words)
        (write-to-string n))))
