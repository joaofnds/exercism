(in-package #:cl-user)
(defpackage #:robot-simulator
  (:use #:common-lisp)
  (:shadow #:position)
  (:export #:north #:east #:south #:west #:execute-sequence
           #:robot #:robot-position #:robot-bearing #:make-robot))

(in-package #:robot-simulator)

;;; commands
(defconstant move #\A)
(defconstant north #\U)
(defconstant east #\R)
(defconstant south #\D)
(defconstant west #\L)

(defmethod new-bearing (bearing turn)
  (ecase bearing
    (#\U (ecase turn
           (#\R #\R)
           (#\L #\L)))
    (#\R (ecase turn
           (#\R #\D)
           (#\L #\U)))
    (#\D (ecase turn
           (#\R #\L)
           (#\L #\R)))
    (#\L (ecase turn
           (#\R #\U)
           (#\L #\D)))))

(defclass robot ()
  ((position :initform (error "must have position") :initarg :position :accessor position)
   (bearing  :initform (error "must have bearing")  :initarg :bearing  :accessor bearing)))

(defmethod turn (robot direction)
  (with-slots (bearing) robot
    (setf bearing (new-bearing bearing direction))))

(defmethod advance (robot)
  (with-slots (position bearing) robot
    (ecase bearing
      (#\U (incf (cdr position)))
      (#\R (incf (car position)))
      (#\D (decf (cdr position)))
      (#\L (decf (car position))))))

(defmethod run-command (robot command)
  (ecase command
    (#\A (advance robot))
    ((#\R #\L) (turn robot command)))
  robot)

;;; exercise functions
(defun make-robot (&key (position '(0 . 0)) (bearing north))
  (make-instance 'robot :position position :bearing bearing))

(defmethod robot-position (robot)
  (position robot))

(defmethod robot-bearing (robot)
  (bearing robot))

(defmethod execute-sequence (robot sequence)
  (reduce #'run-command sequence :initial-value robot))
