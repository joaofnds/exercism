(defpackage :run-length-encoding
  (:use :cl)
  (:export :encode :decode))

(in-package :run-length-encoding)

(defun encode (plain)
  (with-output-to-string (stream)
    (loop :for prev := c
          :for c :across plain
          :if (and prev (char= c prev))
            :sum 1 :into count
          :else
            :do (write-encoded-char stream prev count)
            :and :do (setf count 1)
          :finally (write-encoded-char stream prev count))))

(defun decode (compressed)
  (with-output-to-string (stream)
    (loop :with count
          :for c :across compressed
          :if (digit-char-p c)
            :do (push (digit-char-p c) count)
          :else
            :do (loop :for i :below (if count (parse-digit-list count) 1)
                      :do (write-char c stream)
                      :finally (setf count nil)))))

(defun write-encoded-char (stream char count)
  (when (> count 1)
    (loop :for d :across (write-to-string count)
          :do (write-char d stream)))
  (when (> count 0)
    (write-char char stream)))

(defun parse-digit-list (digits)
  (loop :for digit :in digits
        :for i :from 0 :below (length digits)
        :summing (* digit (expt 10 i))))
