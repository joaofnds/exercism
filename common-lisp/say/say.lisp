(defpackage :say
  (:use :cl)
  (:export :say))

(in-package :say)

(defun say (number)
  (when (<= 0 number 999999999999)
    (format nil "~r" number)))
