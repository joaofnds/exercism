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
  (with-input-from-string (dna dna-sequence)
    (with-output-to-string (rna)
      (loop :for dna-nucleotide = (read-char dna nil)
            :while dna-nucleotide
            :for rna-nucleotide = (gethash dna-nucleotide *dna-rna-hash*)
            :if rna-nucleotide
              :do (write-char rna-nucleotide rna)
            :else
              :do (return (error "~a is not a DNA nucleotide" dna-nucleotide))))))
