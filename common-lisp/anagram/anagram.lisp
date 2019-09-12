(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun anagrams-for (word candidates)
  (loop :for candidate :in candidates
        :when (anagram-p word candidate)
          :collect candidate))

(defun anagram-p (word candidate)
  (when (and (= (length word) (length candidate))
             (string-not-equal word candidate))
    (loop :for char :across word
          :for word-char-count = (count char word :test #'char-equal)
          :for candidate-char-count = (count char candidate :test #'char-equal)
          :always (= word-char-count candidate-char-count))))
