(in-package #:cl-user)
(defpackage #:twelve-days
  (:use #:cl)
  (:export #:recite))

(in-package #:twelve-days)

(defparameter *presents* '("a Partridge in a Pear Tree"
                           "two Turtle Doves"
                           "three French Hens"
                           "four Calling Birds"
                           "five Gold Rings"
                           "six Geese-a-Laying"
                           "seven Swans-a-Swimming"
                           "eight Maids-a-Milking"
                           "nine Ladies Dancing"
                           "ten Lords-a-Leaping"
                           "eleven Pipers Piping"
                           "twelve Drummers Drumming"))

(defun day-presents (day)
  (loop :for i :from (1- day) :downto 0
        :collect (nth i *presents*)))

(defun verse (day)
  (format nil "On the ~:r day of Christmas my true love gave to me: ~{~a~^, ~#[~;and ~]~}."
          day (day-presents day)))

(defun recite (&optional (begin 1 begin-supplied-p) (end (if begin-supplied-p begin 12)))
  (when (<= 1 begin end 12)
    (format nil "~{~a~^~%~}" (loop :for i :from begin :to end
                                   :collect (verse i)))))
