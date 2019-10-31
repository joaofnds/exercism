(defpackage #:trinary
  (:use #:common-lisp)
  (:export #:to-decimal))

(in-package #:trinary)

(defun to-decimal (str)
  (or (parse-integer str :radix 3 :junk-allowed t) 0))

;; Below is how I would've done it without parse-integer

;; (defun trinary-p (n)
;;   (and (integerp n) (<= 0 n 2)))

;; (defun to-decimal (str)
;;   (loop :for digit :across str
;;         :for i :downfrom (1- (length str))
;;         :for n := (digit-char-p digit)
;;         :if (trinary-p n)
;;           :sum (* n (expt 3 i))
;;         :else
;;           :do (return 0)))
