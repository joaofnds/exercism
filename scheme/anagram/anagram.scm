(import (rnrs))

(define (anagram target words)
  (filter (lambda (w) (anagram? target w)) words))

(define (anagram? word candidate)
  (and
   (not (string-ci=? word candidate))
   (= (string-length word) (string-length candidate))
   (for-all
    char-ci=?
    (sort char-ci<? (string->list word))
    (sort char-ci<? (string->list candidate)))))
