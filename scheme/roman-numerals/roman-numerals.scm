(import (rnrs))

(define arabic->roman
  '((1000 "M") (900 "CM") (500 "D") (400 "CD")
    (100  "C") (90  "XC") (50  "L") (40  "XL")
    (10   "X") (9   "IX") (5   "V") (4   "IV")
    (1    "I")))

(define (closest-roman n)
  (find
   (lambda (arab-roman) (>= n (car arab-roman)))
   arabic->roman))

(define (roman n)
  (do ((arab-roman (closest-roman n) (closest-roman n))
       (result "" (string-append result (cadr arab-roman))))
      ((not (list? arab-roman)) result)
    (set! n (- n (car arab-roman)))))
