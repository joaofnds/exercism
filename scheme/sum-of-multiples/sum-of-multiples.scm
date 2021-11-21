(import (rnrs))

(define (multiple-of-any? x xs)
  (exists
   (lambda (div)
     (zero? (remainder x div)))
   xs))

(define (sum-of-multiples ints limit)
  (let ((ints (remp zero? ints)))
    (apply
     +
     (filter
      (lambda (n) (multiple-of-any? n ints))
      (iota limit)))))
