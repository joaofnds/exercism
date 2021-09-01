(defpackage :socks-and-sexprs
  (:use :cl)
  (:export :lennys-favorite-food :lennys-secret-keyword
           :is-an-atom-p :is-a-cons-p :first-thing :rest-of-it))

(in-package :socks-and-sexprs)

(defun lennys-favorite-food ()
  'slime)

(defun lennys-secret-keyword ()
  :parens)

(defun is-an-atom-p (thing)
  (atom thing))

(defun is-a-cons-p (thing)
  (consp thing))

(defun first-thing (cons)
  (car cons))

(defun rest-of-it (cons)
  (cdr cons))
