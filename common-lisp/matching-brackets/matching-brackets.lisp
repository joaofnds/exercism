(defpackage :matching-brackets
  (:use :cl)
  (:export :pairedp))

(in-package :matching-brackets)

(defparameter brackets '(#\{ #\} #\( #\) #\[ #\]))

(defun pairedp (value)
  (loop :with stack := '()
        :for c :across value
        :if (opening? c)
          :do (push c stack)
        :if (closing? c)
          :do (unless (and stack (char= (closing? c) (pop stack)))
                (return))
        :finally (return (null stack))))

(defun opening? (value)
  (getf brackets value))

(defun closing? (value)
  (getf (reverse brackets) value))
