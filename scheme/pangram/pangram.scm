(import (rnrs))

(define (pangram? phrase)
  (= 26 (length (filter
                  (lambda (c) (char<=? #\a c #\z))
                  (uniq (string->list (string-downcase phrase)))))))

(define (uniq lst)
  (fold-left
    (lambda (u x) (if (member x u) u (cons x u)))
    (list)
    lst))
