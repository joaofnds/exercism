(defpackage :matrix
  (:use :cl :uiop)
  (:export :row :column))

(in-package :matrix)

(defun parse (input)
  (loop :for row :in (split-string (stripln input) :separator '(#\Newline))
        :collect (mapcar #'parse-integer (split-string row))))

(defun row (input-matrix row)
  (nth (1- row) (parse input-matrix)))

(defun column (input col)
  (loop :with matrix := (parse input)
        :for row :from 0 :below (length matrix)
        :collect (nth (1- col) (nth row matrix))))
