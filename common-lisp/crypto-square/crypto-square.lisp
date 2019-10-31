(in-package #:cl-user)
(defpackage #:crypto-square
  (:use #:cl)
  (:export #:encipher))
(in-package #:crypto-square)

(defun normalize (text)
  (string-downcase (remove-if-not #'alphanumericp text)))

(defun split-into-chunks (str chunk-size)
  (with-input-from-string (in str)
    (loop :for chunk := (make-string chunk-size :initial-element #\Space)
          :for read := (read-sequence chunk in)
          :until (zerop read)
          :collect chunk)))

(defun transpose (matrix)
  (loop :with m := (length matrix) :and n := (length (car matrix))
        :for i :below n
        :collecting (loop :for j :below m
                          :collecting (elt (elt matrix j) i))))

(defun encipher (plaintext)
  (let* ((text (normalize plaintext))
         (len (length text))
         (cols (ceiling (sqrt len))))
    (format nil "~{~{~a~}~^ ~}" (transpose (split-into-chunks text cols)))))
