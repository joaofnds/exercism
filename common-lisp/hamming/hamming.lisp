(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun dna-differences (dna1 dna2)
  "Finds differences between two dna strands"
  (loop :for c1 :across dna1
        :for c2 :across dna2
        :for i :from 0
        :when (char-not-equal c1 c2) :collect (list i c1 c2)))

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length dna1) (length dna2))
    (length (dna-differences dna1 dna2))))
