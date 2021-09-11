(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (apply +
   (map
    (lambda (c1 c2) (if (char=? c1 c2) 0 1))
    (string->list strand-a)
    (string->list strand-b))))
