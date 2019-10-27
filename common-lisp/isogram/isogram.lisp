(defpackage #:isogram
  (:use #:cl)
  (:export #:is-isogram))

(in-package #:isogram)

(defun is-isogram (string)
  "Is string an Isogram?"
  (loop :for char :across string
        :for i :from 1
        :never (and (alpha-char-p char)
                    (find char string :start i :test #'char-equal))))
