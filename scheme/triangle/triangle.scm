(import (rnrs))

(define (triangle a b c)
  (when (illogical? a b c)
    (error "invalid: " a b c))

  (case (length (uniq (list a b c)))
    ((1) 'equilateral)
    ((2) 'isosceles)
    ((3) 'scalene)))

(define (uniq lst)
  (fold-left
   (lambda (u x) (if (member x u) u (cons x u)))
   (list)
   lst))

(define (illogical? a b c)
  (let-values (((a b c) (apply values (sort (list a b c) <))))
    (>= c (+ a b))))
