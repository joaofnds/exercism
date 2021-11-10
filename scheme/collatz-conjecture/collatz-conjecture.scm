(import (rnrs))

(define (collatz n)
  (define (steps n count)
    (if (= 1 n)
        count
        (steps (collatz-of n) (+ 1 count))))

  (steps n 0))

(define (collatz-of n)
  (if (divisible? n 2)
      (/ n 2)
      (+ 1 (* 3 n))))

(define (divisible? x y)
  (zero? (remainder x y)))
