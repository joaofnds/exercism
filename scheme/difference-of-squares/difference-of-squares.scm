(import (rnrs))

(define (square n)
  (* n n))

(define (square-of-sum n)
  (square (fold-left + 0 (iota (1+ n)))))

(define (sum-of-squares n)
  (apply + (map square (iota (1+ n)))))

(define (difference-of-squares n)
  (- (square-of-sum n) (sum-of-squares n)))
