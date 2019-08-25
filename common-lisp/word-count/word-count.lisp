(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(defun hash->alist (hash-table)
  (loop :for key :being :the :hash-keys :in hash-table
        :for value :being :the :hash-values :in hash-table
        :collect (cons key value)))

(defun word-count (str)
  (let ((word-count (make-hash-table :test #'equal))
        (str (concatenate 'string str '(#\Space)))) ; Add space to count last word
    (with-output-to-string (word-s)
      (loop :for last-char := char
            :for char :across str
            :if (alphanumericp char)
              :do (write-char (char-downcase char) word-s)
            :else
              :when (alphanumericp last-char)
                :do (incf (gethash (get-output-stream-string word-s) word-count 0))))
    (hash->alist word-count)))
