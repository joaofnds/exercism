(defpackage :book-store
  (:use :cl)
  (:export :calculate-price))

(in-package :book-store)

(defun calculate-price (basket)
  (loop :for group :in (groups basket)
        :summing (price group)))

(defun groups (basket)
  (loop :for remaining := basket :then (delete-each remaining group)
        :for group := (remove-duplicates remaining)
        :while remaining
        :collect (length group) :into groups
        :finally (return (optimize-groups groups))))

(defun optimize-groups (groups)
  (loop :while (and (find 3 groups) (find 5 groups))
        :do (progn
              (nsubstitute 4 3 groups :count 1)
              (nsubstitute 4 5 groups :count 1))
        :finally (return groups)))

(defun price (group-size)
  (ecase group-size
    (0 0)
    (1 (* 1 8 100))
    (2 (* 2 8 95))
    (3 (* 3 8 90))
    (4 (* 4 8 80))
    (5 (* 5 8 75))))

(defun delete-each (list items)
  (dolist (item items)
    (setf list (delete item list :count 1)))
  list)
