(defpackage :reporting-for-duty
  (:use :cl)
  (:export :format-quarter-value :format-two-quarters
           :format-two-quarters-for-reading))

(in-package :reporting-for-duty)

(defun format-quarter-value (quarter value)
  (format nil "The value ~A quarter: ~A" quarter value))

(defun format-two-quarters (stream q1 v1 q2 v2)
  (format stream "~%~A~%~A~%"
          (format-quarter-value q1 v1)
          (format-quarter-value q2 v2)))

(defun format-two-quarters-for-reading (stream q1 v1 q2 v2)
  (format stream "(~S ~S)"
          (format-quarter-value q1 v1)
          (format-quarter-value q2 v2)))
