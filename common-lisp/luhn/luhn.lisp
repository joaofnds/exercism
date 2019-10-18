(in-package #:cl-user)
(defpackage #:luhn
  (:use #:cl)
  (:export #:is-valid))

(in-package #:luhn)

(defun space-char-p (c)
  (char= c #\Space))

(defun luhn-double (n)
  (if (< n 5)
      (* 2 n)
      (- (* 2 n) 9)))

(defun is-valid (input)
  (let ((input (reverse (remove-if #'space-char-p input))))
    (when (> (length input) 1)
      (loop :for i :from 0
            :for char :across input
            :for digit := (digit-char-p char)
            :always digit
            :if (oddp i)
              :sum (luhn-double digit) :into sum
            :else
              :sum digit :into sum
            :finally (return (zerop (rem sum 10)))))))
