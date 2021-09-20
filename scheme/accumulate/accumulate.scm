(define (accumulate f xs)
  (if (null? xs)
      (list)
      (cons (f (car xs)) (accumulate f (cdr xs)))))
