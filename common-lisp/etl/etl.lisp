(in-package #:cl-user)
(defpackage #:etl
  (:use #:common-lisp)
  (:export #:transform))

(in-package #:etl)

(defun transform (data)
  (let ((new-point-format (make-hash-table :test #'equalp)))
    (maphash
     (lambda (points letters)
       (dolist (letter letters)
         (setf (gethash letter new-point-format) points)))
     data)
    new-point-format))
