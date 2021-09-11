(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (fold-left
    (lambda (n a b) (if (char=? a b) n (1+ n)))
    0
    (string->list strand-a)
    (string->list strand-b)))
