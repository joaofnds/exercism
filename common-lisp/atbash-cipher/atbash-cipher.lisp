(defpackage #:atbash-cipher
  (:use #:common-lisp)
  (:export #:encode))

(in-package #:atbash-cipher)

(defun complement-char (char))

(defun encode-char (char)
  (if (char>= #\z char #\a)
      (code-char (+ 97 (- 122 (char-code char)))) ; #\a = 97; #\z = 122
      char))

(defun encode (plaintext)
  (loop :with in := (string-downcase (remove-if-not #'alphanumericp plaintext))
        :for char :across in
        :for i :from 1
        :collect (encode-char char) :into cipher
        :when (zerop (mod i 5))
          :collect #\Space :into cipher
        :finally (return (string-right-trim " " (coerce cipher 'string)))))
