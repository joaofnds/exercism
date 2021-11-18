(import (rnrs))

(define (armstrong-number? n)
  (= n (armstrong-sum n)))

(define (armstrong-sum n)
  (let ((nums (digits n)))
    (let ((size (length nums)))
      (fold-left
       (lambda (total d) (+ total (expt d size)))
       0
       nums))))

(define (digits n)
  (define (digits-iter n digits)
    (if (zero? (div n 10))
        (cons n digits)
        (digits-iter
         (div n 10)
         (cons (modulo n 10) digits))))

  (digits-iter n (list)))
