(import (rnrs))

(define (square n)
  (if (>= 64 n 1)
      (expt 2 (1- n))
      (error "square outside the valid range [0; 64]" n)))

;; sum of 2^0 to 2^x = 2^(x+1) - 1
(define (total)
  (1- (* 2 (square 64))))
