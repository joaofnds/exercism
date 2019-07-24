(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun trim (str)
  (string-trim '(#\Tab #\Space #\Newline #\Page) str))

(defun ends-with-p (str c)
  (char= c (char (reverse str) 0)))

(defun question-p (str)
  (ends-with-p str #\?))

(defun shout-p (str)
  (and (some #'alpha-char-p str)
       (string= str (string-upcase str))))

(defun saying-something-p (str)
  (string/= str ""))

(defun response-for (input)
  (let ((input (trim input)))
    (cond ((not (saying-something-p input)) "Fine. Be that way!")
          ((and (shout-p input) (question-p input)) "Calm down, I know what I'm doing!")
          ((shout-p input) "Whoa, chill out!")
          ((question-p input) "Sure.")
          (t "Whatever."))))
