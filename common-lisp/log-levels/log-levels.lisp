(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string)
  (string-trim " " (subseq log-string (1+ (position #\: log-string)))))

(defun log-level (log-string)
  (string-downcase (subseq log-string 1 (position #\] log-string))))

(defun log-severity (log-string)
  (let ((severity (log-level log-string)))
    (cond
      ((string= severity "info") :everything-ok)
      ((string= severity "ohno") :run-for-cover)
      ((string= severity "warn") :getting-worried))))

(defun log-format (log-string)
  (let ((msg (log-message log-string))
        (level (log-severity log-string)))
    (case level
      (:everything-ok (string-downcase msg))
      (:run-for-cover (string-upcase msg))
      (:getting-worried (string-capitalize msg)))))
