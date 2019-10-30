(in-package #:cl-user)
(defpackage #:armstrong-numbers
  (:use #:cl)
  (:export #:armstrong-number-p))
(in-package #:armstrong-numbers)

(defun armstrong-sum (number)
  (loop :with digits := (map 'list #'digit-char-p (prin1-to-string number))
        :with digit-count := (length digits)
        :for digit :in digits
        :sum (expt digit digit-count)))

(defun armstrong-number-p (number)
  (= (armstrong-sum number) number))
