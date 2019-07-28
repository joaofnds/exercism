(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defun rna-complement (nucleotide)
  (case nucleotide
    (#\G #\C)
    (#\C #\G)
    (#\T #\A)
    (#\A #\U)
    (t (error "~a is not a DNA nucleotide" nucleotide))))

(defun to-rna (str)
  (map 'string #'rna-complement str))
