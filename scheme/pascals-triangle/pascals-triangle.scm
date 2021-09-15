(import (rnrs))

(define (fact n)
  (fold-left * 1 (iota n 1)))

(define (n-choose-k n k)
  (/ (fact n)
     (* (fact k) (fact (- n k)))))

(define (row n)
  (map (lambda (k) (n-choose-k (1- n) k)) (iota n)))

(define (pascals-triangle n)
  (map row (iota n 1)))
