(defpackage :two-bucket
  (:use :common-lisp)
  (:export :measure))

(in-package :two-bucket)

(defun measure (bucket-one bucket-two goal start-bucket)
  (if (or (plusp (mod goal (gcd bucket-one bucket-two)))
          (and (> goal bucket-one) (> goal bucket-two)))
      nil
      (let ((other-bucket (if (eq start-bucket :one) :two :one))
            (buckets (if (eq start-bucket :one)
                         (list bucket-one bucket-two)
                         (list bucket-two bucket-one))))
        (destructuring-bind (move end-bucket other) (apply #'solve goal buckets)
          (pairlis '(:moves :goal-bucket :other-bucket)
                   (list move (if (eq end-bucket :start) start-bucket other-bucket) other))))))

(defun solve (goal start-capacity other-capacity)
  (do ((move 1 (incf move))
       (start start-capacity)
       (other 0))
      ((or (= start goal) (= other goal))
       (list move (if (= start goal) :start :other) (if (= start goal) other start)))
    (cond
      ((= goal other-capacity) (setf other other-capacity))
      ((= other other-capacity) (setf other 0))
      ((zerop start) (setf start start-capacity))
      (t (let ((extra (- (+ other start) other-capacity)))
           (if (plusp extra)
               (psetf start extra other other-capacity)
               (psetf start 0  other (+ other start))))))))
