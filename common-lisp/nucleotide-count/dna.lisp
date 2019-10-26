(in-package #:cl-user)
(defpackage #:dna
  (:use #:common-lisp)
  (:export #:dna-count #:nucleotide-counts #:invalid-nucleotide))

(in-package #:dna)

(defparameter *nucleotides* '(#\G #\C #\T #\A))

(define-condition invalid-nucleotide (error)
  ((nucleotide :initarg :nucleotide :reader nucleotide)))

(defun dna-count (nucleotide dna)
  (if (member nucleotide *nucleotides*)
      (count-if (lambda (c) (char= c nucleotide)) dna)
      (error 'invalid-nucleotide :nucleotide nucleotide)))

(defun nucleotide-counts (dna)
  (let ((counting-hash (make-hash-table :size 4)))
    (dolist (nucleotide *nucleotides*)
      (setf (gethash nucleotide counting-hash) 0))
    (loop :for nucleotide :across dna
          :do (incf (gethash nucleotide counting-hash 0))
          :finally (return counting-hash))))
