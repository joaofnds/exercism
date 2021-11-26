(import (rnrs))

(define (factor-of? a b)
  (zero? (remainder a b)))

(define (drops number)
  (call-with-string-output-port
   (lambda (out)
     (when (factor-of? number 3)
       (put-string out "Pling"))
     (when (factor-of? number 5)
       (put-string out "Plang"))
     (when (factor-of? number 7)
       (put-string out "Plong")))))

(define (convert number)
  (let ((sounds (drops number)))
    (if (zero? (string-length sounds))
        (number->string number)
        sounds)))
