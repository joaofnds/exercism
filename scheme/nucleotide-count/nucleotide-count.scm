(import (rnrs))

(define (make-count-list)
  (map (lambda (c) (cons c 0)) '(#\A #\C #\G #\T)))

(define (update pairlis key fn)
  (let ((pair (assoc key pairlis)))
    (set-cdr! pair (fn (cdr pair)))
    pairlis))

(define (reduce f init l)
  (if (null? l)
      init
      (reduce f (f init (car l)) (cdr l))))

(define (nucleotide-count dna)
  (reduce
   (lambda (l c) (update l c 1+))
   (make-count-list)
   (string->list dna)))
