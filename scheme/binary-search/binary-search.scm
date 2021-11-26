(import (rnrs))

(define (append list item)
  (if (null? list)
      item
      (cons (car list) (append (cdr list) item))))

(define (drop l n)
  (define (drop-iter l n i)
    (if (= n i)
        l
        (drop-iter (cdr l) n (+ 1 i))))

  (drop-iter l n 0))

(define (take l n)
  (define (take-iter l n i r)
    (if (= n i)
        r
        (take-iter (cdr l) n (+ 1 i) (append r (list (car l))))))


  (take-iter l n 0 (list)))

(define (slice l offset size)
  (take (drop l offset) size))

(define (comp x y)
  (let ((result (- x y)))
    (cond
     ((negative? result) -1)
     ((zero? result) 0)
     ((positive? result) 1))))

(define (binary-search vector target)
  (define (search vector target left right)
    (if (<= right left)
        'not-found
        (let ((mid (floor (+ left (/ (- right left) 2)))))
          (case (comp target (vector-ref vector mid))
            ((-1) (search vector target left mid))
            ((0)  mid)
            ((1)  (search vector target (+ 1 mid) right))))))

  (search vector target 0 (vector-length vector)))
