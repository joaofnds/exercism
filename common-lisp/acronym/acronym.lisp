(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun acronym (str)
  (loop :for last-char := #\Space :then c
        :for c :across str
        :when (and (not (alpha-char-p last-char)) (alpha-char-p c))
          :collect (char-upcase c) :into initials
        :finally (return (coerce initials 'string))))
