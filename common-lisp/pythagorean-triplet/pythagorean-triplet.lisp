(defpackage :pythagorean-triplet
  (:use :cl)
  (:export :triplets-with-sum))

(in-package :pythagorean-triplet)

(defun triplets-with-sum (n)
  (loop :for a :in (range 1 n)
        :nconc (loop :for b :in (range (1+ a) n)
                     :for c := (- n a b)
                     :while (plusp c)
                     :when (pythagorean? a b c)
                       :collect (list a b c))))

(defun range (start end)
  (loop :for i :from start :below end :collect i))

(defun pythagorean? (a b c)
  (= (+ (* a a) (* b b)) (* c c)))
