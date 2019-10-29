(in-package #:cl-user)
(defpackage #:allergies
  (:use #:common-lisp)
  (:shadow #:list)
  (:export #:allergic-to-p #:list))

(in-package #:allergies)

(defparameter *allergens-score*
  '(("cats" . 128)
    ("pollen" . 64)
    ("chocolate" . 32)
    ("tomatoes" . 16)
    ("strawberries" . 8)
    ("shellfish" . 4)
    ("peanuts" . 2)
    ("eggs" . 1)))

(defun list (score)
  (loop :with score := (mod score 256)
        :with n := 0
        :for (allergen . allergen-score) :in *allergens-score*
        :when (>= score (+ n allergen-score))
          :collect allergen :into allergens
          :and :do (incf n allergen-score)
        :finally (return (reverse allergens))))

(defun allergic-to-p (score allergen)
  (find allergen (list score) :test #'string-equal))
