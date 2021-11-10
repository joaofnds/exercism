(import (rnrs))

(define (divisible? x y)
  (zero? (remainder x y)))

(define (collatz n)
  (define (steps n count)
    (cond
     ((= 1 n) count)
     ((divisible? n 2)
      (steps (/ n 2) (+ 1 count)))
     (else
      (steps (+ 1 (* 3 n)) (+ 1 count)))))

  (steps n 0))
