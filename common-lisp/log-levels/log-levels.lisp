(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string)
  (subseq log-string 8))

(defun log-severity (log-string)
  (let ((severity (string-downcase (subseq log-string 1 5))))
    (cond
      ((string= severity "info") :everything-ok)
      ((string= severity "ohno") :run-for-cover)
      ((string= severity "warn") :getting-worried))))

(defun log-format (log-string)
  (let ((message (log-message log-string))
        (severity (log-severity log-string)))
    (case severity
      (:everything-ok (string-downcase message))
      (:run-for-cover (string-upcase message))
      (:getting-worried (string-capitalize message)))))
