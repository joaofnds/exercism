(defpackage :palindrome-products
  (:use :cl)
  (:export :smallest
   :largest))

(in-package :palindrome-products)

(defun smallest (min max)
  (when (> max min)
    (loop :for n :from (expt min 2) :to (expt max 2)
          :when (palindromep n min max)
            :return (values n (factors n min max)))))

(defun largest (min max)
  (when (> max min)
    (loop :for n :from (expt max 2) :downto (expt min 2)
          :when (palindromep n min max)
            :return (values n (factors n min max)))))

(defun palindromep (number min max)
  (let ((num (write-to-string number)))
    (when (string= num (reverse num))
      (loop :for factor :from min :to max
            :when (multiple-value-bind (q m) (floor number factor)
                    (and (zerop m) (<= min q max)))
              :return t))))

(defun factors (n min max)
  (loop :for factor :from min :to (isqrt n) :with q :and m
        :do (multiple-value-setq (q m) (floor n factor))
        :when (and (zerop m) (<= min q max))
          :collect (list factor q)))
