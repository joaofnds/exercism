(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defun xor (a b)
  (or (and a (not b))
      (and b (not a))))

(defparameter *minutes-per-layer* 19)

(defun preparation-time (&rest layers)
  (* *minutes-per-layer* (length layers)))

(defun remaining-minutes-in-oven (&optional (mode :normal))
  (case mode
    (:very-long 537)
    (:longer 437)
    (:normal 337)
    (:shorter 237)
    (:very-short 137)
    ((nil) 0)))

(defun split-leftovers
  (&key (weight 0 weight-given-p)
        (human 0 human-given-p)
        (alien 0 alien-given-p))
  (let ((extra (if (xor human-given-p alien-given-p) 10 0)))
    (cond
       ((null weight) :looks-like-someone-was-hungry)
       ((not weight-given-p) :just-split-it)
       ((not (or human-given-p alien-given-p)) 0)
       (t (- weight (+ human alien extra))))))

(split-leftovers :weight nil)
