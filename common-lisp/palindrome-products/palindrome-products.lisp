(defpackage :palindrome-products
  (:use :cl)
  (:export :smallest
   :largest))

(in-package :palindrome-products)

(defun smallest (min max)
  (when (> max min)
    (loop :with pals := (palindromes min max)
          :for i :in pals :by #'cddr
          :minimizing i :into min
          :finally (return (results-for pals min)))))

(defun largest (min max)
  (when (> max min)
    (loop :with pals := (palindromes min max)
          :for i :in pals :by #'cddr
          :maximizing i :into max
          :finally (return (results-for pals max)))))

(defun palindromes (min max)
  (loop :with pals
        :for i :from min :to max
        :do (loop :for j :from i :to max
                  :when (palindromep (* i j))
                    :do (pushnew (list i j) (getf pals (* i j))))
        :finally (return pals)))

(defun palindromep (n)
  (let ((str (write-to-string n)))
    (string= str (reverse str))))

(defun results-for (palindromes key)
  (let ((pals (getf palindromes key)))
    (when pals
      (values key (reverse pals)))))
