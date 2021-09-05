(defpackage :larrys-winning-checker
  (:use :cl)
  (:export
   :make-empty-board
   :make-board-from-list
   :all-the-same-p
   :row
   :column))

(in-package :larrys-winning-checker)

(defun make-empty-board ()
  (make-array '(3 3) :initial-element nil))

(defun make-board-from-list (list)
  (make-array '(3 3) :initial-contents list))

(defun all-the-same-p (seq)
  (= 1 (length (remove-duplicates seq))))

(defun row (board row-num)
  (vector (aref board row-num 0)
          (aref board row-num 1)
          (aref board row-num 2)))

(defun column (board col-num)
  (vector (aref board 0 col-num)
          (aref board 1 col-num)
          (aref board 2 col-num)))
