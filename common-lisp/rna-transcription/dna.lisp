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
  (let ((rna-sequence (make-array (length dna-sequence)
                                  :fill-pointer 0
                                  :element-type 'character)))
    (loop :for nucleotide :across dna-sequence
          :for rna-nucleotide = (gethash nucleotide *dna-rna-hash*)
          :if rna-nucleotide
            :do (vector-push rna-nucleotide rna-sequence)
          :else
            :do (return (error "~a is not a DNA nucleotide" nucleotide))
          :finally (return rna-sequence))))
