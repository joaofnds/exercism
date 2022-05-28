(defpackage :isbn-verifier
  (:use :cl)
  (:export :validp))

(in-package :isbn-verifier)

(defun validp (isbn)
  (loop :for digit :across isbn
        :when (isbn-digit? digit (1+ i))
          :sum (isbn-value digit i) :into total
          :and :sum 1 :into i
        :finally (return (and (= (alphanumeric-count isbn) i 10)
                              (zerop (rem total 11))))))

(defun alphanumeric-count (isbn)
  (loop :for digit :across isbn :counting (alphanumericp digit)))

(defun isbn-digit? (digit pos)
  (or (digit-char-p digit)
      (and (= 10 pos) (char= digit #\X))))

(defun isbn-value (digit pos)
  (* (digit-value digit) (- 10 pos)))

(defun digit-value (digit)
  (if (char-equal digit #\X)
      10
      (digit-char-p digit)))
