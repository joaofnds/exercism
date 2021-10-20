(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (nums num)
  (if (evenp num)
      (push num (cdr nums))
      (push num (car nums)))
  nums)

(defun partition-numbers (nums)
  (loop :for num :in nums
        :if (evenp num)
          :collect num :into evens
        :else
          :collect num :into odds
        :finally (return (cons (nreverse odds)
                               (nreverse evens)))))
