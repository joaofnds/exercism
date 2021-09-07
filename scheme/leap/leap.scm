(import (rnrs))

(define (divisible? x y)
  (zero? (remainder x y)))

(define (leap-year? year)
  (cond
   ((divisible? year 400) #t)
   ((divisible? year 100) #f)
   ((divisible? year 4)   #t)
   (else #f)))
