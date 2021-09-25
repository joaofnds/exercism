(import (rnrs))

(define (to-decimal s)
  (if (not (string-every trinary-char? s))
      0
      (apply +
       (map
        (lambda (c i) (* (char->number c) (expt 3 i)))
        (reverse (string->list s))
        (iota (string-length s) 0)))))

(define (trinary-char? c)
  (char<=? #\0 c #\2))

(define (char->number c)
  (- (char->integer c) (char->integer #\0)))
