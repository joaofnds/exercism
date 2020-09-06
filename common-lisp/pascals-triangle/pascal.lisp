(in-package #:cl-user)
(defpackage #:pascal
  (:use #:cl)
  (:export #:rows))
(in-package #:pascal)

(defun rows (n)
  (loop :for i :below n
        :for prev := row
        :for row := (loop :for j :upto i
                          :for a := b
                          :for b := (nth j prev)
                          :collect (if (and a b) (+ a b) 1))
        :collect row))


;; Pretty print Pascal Triangle
;; (let ((triangle (rows 5)))
;;   (loop :with maxlen := (1- (* 2 (length (car (last triangle)))))
;;         :for row :in triangle
;;         :for padding := (make-string (- maxlen (length row)) :initial-element #\Space)
;;         :collect (format nil "~a~{~a~^ ~}" padding row) :into lines
;;         :finally (format t "~{~a~%~}" lines)))
