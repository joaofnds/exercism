(import (rnrs))

(define (sieve n)
 (let ((marks (make-bitvector (1+ n))))
  (define (sieve-iter i)
   (cond
    ((> i n)
     (fold-left (lambda (acc index marked?)
                 (if marked?
                  acc
                  (append acc (list index))))
                (list)
                (iota n 2)
                (cddr (bitvector->list marks))))
    ((not (bitvector-bit-set? marks i))
     (begin
      (do ((j (+ i i) (+ j i))) ((> j n) j) (bitvector-set! marks j #t))
      (sieve-iter (1+ i))))
    (#t
     (sieve-iter (1+ i)))))

  (sieve-iter 2)))
