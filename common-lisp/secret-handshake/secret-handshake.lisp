(defpackage :secret-handshake
  (:use :cl)
  (:export :commands))

(in-package :secret-handshake)

(defun commands (number)
  (let ((handshake (list)))
    (when (bit-test number 0) (push "wink" handshake))
    (when (bit-test number 1) (push "double blink" handshake))
    (when (bit-test number 2) (push "close your eyes" handshake))
    (when (bit-test number 3) (push "jump" handshake))
    (when (bit-test number 4) (setf handshake (nreverse handshake)))

    (nreverse handshake)))

(defun bit-test (number position)
  (plusp (logand number (expt 2 position))))
