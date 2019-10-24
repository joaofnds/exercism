(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth
           #:on-mercury
           #:on-venus
           #:on-mars
           #:on-jupiter
           #:on-saturn
           #:on-uranus
           #:on-neptune))

(in-package #:space-age)

(defun on-earth (n)
  (/ n 31557600))

(defun on-mercury (n)
  (/ (on-earth n) 0.2408467))

(defun on-venus (n)
  (/ (on-earth n) 0.61519726))

(defun on-mars (n)
  (/ (on-earth n) 1.8808158))

(defun on-jupiter (n)
  (/ (on-earth n) 11.862615))

(defun on-saturn (n)
  (/ (on-earth n) 29.447498))

(defun on-uranus (n)
  (/ (on-earth n) 84.016846))

(defun on-neptune (n)
  (/ (on-earth n) 164.79132))
