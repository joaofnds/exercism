(in-package #:cl-user)
(defpackage #:robot
  (:use #:common-lisp)
  (:export #:build-robot #:robot-name #:reset-name))

(in-package #:robot)

(setf *random-state* (make-random-state t))
(defvar *given-names* nil)
(defvar *next-id* 1)

(defun gen-id ()
  (1- (incf *next-id*)))

(defun gen-name ()
  (coerce
   (list (code-char (+ 65 (random 26))) ; random char from #\A to #\Z
         (code-char (+ 65 (random 26))) ; random char from #\A to #\Z
         (code-char (+ 48 (random 10))) ; random char from #\0 to #\9
         (code-char (+ 48 (random 10))) ; random char from #\0 to #\9
         (code-char (+ 48 (random 10)))) ; random char from #\0 to #\9
   'string))

(defun emit-name ()
  (let ((name (gen-name)))
    (if (find name *given-names* :test #'string=)
        (emit-name)
        name)))

(defclass robot ()
  ((id :initform (gen-id)
       :reader id)
   (name :initform (emit-name)
         :accessor robot-name)))

(defmethod (setf robot-name) :before (name robot)
  (with-accessors ((old-name robot-name)) robot
    (remove-if (lambda (name) (string= name old-name)) *given-names*)))

(defmethod (setf robot-name) :after (name robot)
  (push name *given-names*))

(defmethod reset-name (robot)
  (setf (robot-name robot) (emit-name)))

(defun build-robot ()
  (make-instance 'robot))
