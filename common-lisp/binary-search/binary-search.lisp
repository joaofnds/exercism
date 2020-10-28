(in-package #:cl-user)
(defpackage #:binary-search
  (:use #:common-lisp)
  (:export #:binary-find #:value-error))

(in-package #:binary-search)

(defun binary-find (arr el)
  (loop :for left    := 0                 :then (if (< el current) left        (1+ middle))
        :for right   := (1- (length arr)) :then (if (< el current) (1- middle) right)
        :for middle  := (+ left (floor (- right left) 2))
        :while (not (minusp middle))
        :for current := (elt arr middle)
        :when (= el current)
          :do (return middle)
        :while (< left right)))
