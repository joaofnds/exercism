(defpackage :protein-translation
  (:use :cl)
  (:export :proteins :invalid-protein))

(in-package :protein-translation)

(define-condition invalid-protein (error) nil)

(defvar *codon->protein*
  '(("AUG" . "Methionine")
    ("UUU" . "Phenylalanine")
    ("UUC" . "Phenylalanine")
    ("UUA" . "Leucine")
    ("UUG" . "Leucine")
    ("UCU" . "Serine")
    ("UCC" . "Serine")
    ("UCA" . "Serine")
    ("UCG" . "Serine")
    ("UAU" . "Tyrosine")
    ("UAC" . "Tyrosine")
    ("UGU" . "Cysteine")
    ("UGC" . "Cysteine")
    ("UGG" . "Tryptophan")
    ("UAA" . "STOP")
    ("UAG" . "STOP")
    ("UGA" . "STOP")))


(defun proteins (strand)
  (loop :for i :below (length strand) :by 3
        :for codon := (subseq strand i (min (+ i 3) (length strand)))
        :for (_ . protein) := (assoc codon *codon->protein* :test #'string=)
        :while (string-not-equal protein "STOP")
        :when (null protein)
          :do (error 'invalid-protein)
        :collect protein))
