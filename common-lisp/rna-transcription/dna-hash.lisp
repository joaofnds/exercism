(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defparameter *dna-rna-hash* (make-hash-table))
(setf (gethash #\G *dna-rna-hash*) #\C)
(setf (gethash #\C *dna-rna-hash*) #\G)
(setf (gethash #\T *dna-rna-hash*) #\A)
(setf (gethash #\A *dna-rna-hash*) #\U)

(defun to-rna (dna-sequence)
  (format nil "~{~A~}"
    (loop for nucleotide across dna-sequence
          for rna-nucleotide = (gethash nucleotide *dna-rna-hash*)
          when (null rna-nucleotide)
            do (return (error "~a is not a DNA nucleotide" nucleotide))
          collect rna-nucleotide)))
