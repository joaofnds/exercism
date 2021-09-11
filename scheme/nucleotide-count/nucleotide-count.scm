(import (rnrs))

(define (make-count-list)
  (map (lambda (c) (cons c 0)) '(#\A #\C #\G #\T)))

(define (update pairlis key fn)
  (let ((pair (assoc key pairlis)))
    (set-cdr! pair (fn (cdr pair)))
    pairlis))

(define (nucleotide-count dna)
  (fold-left
   (lambda (l c) (update l c 1+))
   (make-count-list)
   (string->list dna)))
