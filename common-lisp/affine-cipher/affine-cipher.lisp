(defpackage :affine-cipher
  (:use :cl)
  (:export :encode
           :decode))

(in-package :affine-cipher)

(defparameter alphabet "abcdefghijklmnopqrstuvwxyz")

(defun encode (plaintext a b)
  (let ((m (length alphabet)))
    (when (coprimes? a m)
      (loop :for letter :across plaintext
            :for i := (letter-index letter)
            :if i
              :collect (letter-at (encrypt a b i m)) :into letters
            :else :if (digit-char-p letter)
              :collect letter :into letters
            :finally (return (group (concatenate 'string letters)))))))

(defun decode (ciphertext a b)
  (let ((m (length alphabet)))
    (when (coprimes? a m)
      (loop :for letter :across ciphertext
            :for y := (letter-index letter)
            :if y
              :collect (letter-at (decrypt a b y m)) :into letters
            :else :if (digit-char-p letter)
              :collect letter :into letters
            :finally (return (concatenate 'string letters))))))

(defun letter-index (letter)
  (position letter alphabet :test #'char-equal))

(defun letter-at (index)
  (aref alphabet index))

(defun encrypt (a b i m)
  (mod (+ (* a i) b) m))

(defun decrypt (a b y m)
  (mod (* (mmi a) (- y b)) m))

(defun coprimes? (a b)
  (= 1 (gcd a b)))

(defun mmi (a)
  (loop :with m := (length alphabet)
        :for n :from 0 :below m
        :when (= 1 (mod (* a n) m))
          :return n))

(defun chunk (seq size)
  (loop :with len := (length seq)
        :for left :from 0 :below len :by size
        :for right := (min len (+ left size))
        :collect (subseq seq left right)))

(defun interpose (seq thing)
  (loop :with len := (length seq)
        :for i :from 1
        :for elem :in seq :collect elem
        :when (< i len) :collect thing))

(defun group (string)
  (apply #'concatenate 'string (interpose (chunk string 5) " ")))
