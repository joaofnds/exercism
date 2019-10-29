(defpackage #:sieve
  (:use #:cl)
  (:export #:primes-to)
  (:documentation "Generates a list of primes up to a given limit."))

(in-package #:sieve)

(defun primes-to (n)
  (loop :with range := (loop :for i :from 2 :to n :collecting (cons i nil))
        :for i :to (- n 2)
        :for (j . marked?) := (elt range i)
        :unless marked?
          :do (loop :for k :from j :to (- n 2)
                    :for (l . marked?) := (elt range k)
                    :when (and (not marked?) (zerop (mod l j)))
                      :do (setf (elt range k) (cons l t)))
        :finally (return (map 'list #'car (remove-if #'cdr range)))))
