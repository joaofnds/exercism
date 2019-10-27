(in-package #:cl-user)
(defpackage #:triangle
  (:use #:cl)
  (:export #:triangle))

(in-package #:triangle)

(defun equilateralp (a b c)
  (= a b c))

(defun isoscelesp (a b c)
  (or (= a b) (= b c) (= a c)))

(defun scalenep (a b c)
  (/= a b c))

(defun illogicalp (a b c)
  (or (>= a (+ b c))
      (>= b (+ a c))
      (>= c (+ a b))))

(defun triangle (a b c)
  (cond
    ((illogicalp a b c) :illogical)
    ((scalenep a b c) :scalene)
    ((equilateralp a b c) :equilateral)
    ((isoscelesp a b c) :isosceles)))
