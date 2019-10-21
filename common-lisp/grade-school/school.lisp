(defpackage #:school
  (:use #:common-lisp)
  (:export #:make-school #:add #:grade-roster #:grade #:sorted))

(in-package #:school)

(defclass school ()
  ((grade-roster
    :initform '()
    :accessor grade-roster)))

(defun make-school ()
  (make-instance 'school))

(defun grade-code (grade)
  (getf grade :grade))

(defun grade-students (grade)
  (getf grade :students))

(defmethod find-grade (school grade)
  (find grade (grade-roster school) :key #'grade-code))

(defmethod create-grade (school grade)
  (let ((new-grade (list :grade grade :students '())))
    (push new-grade (grade-roster school))
    new-grade))

(defmethod get-grade (school grade)
  "Gets a grade if it exists, create one if it doesn't."
  (or (find-grade school grade)
      (create-grade school grade)))

(defmethod add (school name grade)
  (let ((grade (get-grade school grade)))
    (unless (find name (grade-students grade) :test #'string-equal)
      (push name (getf grade :students)))))

(defmethod grade (school grade)
  (grade-students (find-grade school grade)))

(defmethod sorted (school)
  (sort (grade-roster school) #'< :key #'grade-code))
