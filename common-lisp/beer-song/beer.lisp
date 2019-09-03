(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defparameter *verse-format*
  "~[No more~:;~:*~d~] bottle~:p of beer on the wall, ~:*~[no more~:;~:*~d~] bottle~:p of beer.
~:*~[Go to the store and buy some more, 99 bottles of beer on the wall~:;~
     Take ~[it~:;one~] down and pass it around, ~:*~[no more~:;~:*~d~] bottle~:p of beer on the wall~].~%")

(defun verse (verse-number)
  (format nil *verse-format* verse-number (1- verse-number)))

(defun sing (start &optional (end 0))
  (format nil "~{~a~%~}" (loop :for verse-number :from start :downto end
                               :collect (verse verse-number))))
