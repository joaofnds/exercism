(in-package #:cl-user)
(defpackage #:phone
  (:use #:common-lisp)
  (:export #:numbers #:area-code #:pretty-print))

(in-package #:phone)

(defun numbers (number)
  (let ((clean-number (remove-if-not #'digit-char-p number)))
    (cond
      ((and (= 11 (length clean-number)) (char= #\1 (char clean-number 0)))
       (subseq number 1))
      ((= 10 (length clean-number))
       clean-number)
      (t "0000000000"))))

(defun area-code (number)
  (subseq (numbers number) 0 3))

(defun pretty-print (number)
  (let ((clean-number (numbers number)))
    (format nil "(~d) ~d-~d"
            (subseq clean-number 0 3)
            (subseq clean-number 3 6)
            (subseq clean-number 6 10))))
