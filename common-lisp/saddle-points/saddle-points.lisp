(defpackage :saddle-points
  (:use :cl)
  (:export :saddle-points))

(in-package :saddle-points)

(defun max-row (matrix row)
  (loop :for col :below (array-dimension matrix 1) :maximize (aref matrix row col)))

(defun min-col (matrix col)
  (loop :for row :below (array-dimension matrix 0) :minimize (aref matrix row col)))

(defun is-saddle-point (matrix row col)
  (and (= (aref matrix row col) (max-row matrix row))
       (= (aref matrix row col) (min-col matrix col))))

(defun saddle-points (matrix)
  (multiple-value-bind (rows cols) (values-list (array-dimensions matrix))
    (loop :for row :below rows
          :append (loop :for col :below cols
                        :when (is-saddle-point matrix row col)
                          :collect (list (1+ row) (1+ col))))))
