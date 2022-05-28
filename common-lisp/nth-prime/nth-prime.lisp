(defpackage :nth-prime
  (:use :cl)
  (:export :find-prime))

(in-package :nth-prime)

(defun find-prime (number)
  (unless (zerop number)
    (loop :for n :from 2
          :when (prime? n) :sum 1 :into i
          :when (= i number) :return n)))

(defun prime? (number)
  (loop :for i :from 2 :upto (sqrt number)
        :never (zerop (rem number i))))
