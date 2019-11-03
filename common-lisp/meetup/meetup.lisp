(in-package #:cl-user)
(defpackage #:meetup
  (:use #:common-lisp)
  (:export #:meetup))

(in-package #:meetup)

(defconstant +weekdays+
  '(:monday :tuesday :wednesday :thursday :friday :saturday :sunday))

(defun universal-time-component (universal-time component)
  (let ((components (multiple-value-list (decode-universal-time universal-time 0))))
    (ecase component
      (:second (nth 0 components))
      (:minute (nth 1 components))
      (:hour (nth 2 components))
      (:date (nth 3 components))
      (:month (nth 4 components))
      (:year (nth 5 components))
      (:day (nth 6 components))
      (:daylight-p (nth 7 components))
      (:zone (nth 8 components)))))

(defun valid-date-p (date month year)
  (let ((ut (handler-case (encode-universal-time 0 0 0 date month year 0)
              (t () nil))))
    (and ut
         (= date (universal-time-component ut :date))
         (= month (universal-time-component ut :month))
         (= year (universal-time-component ut :year)))))

(defun weekday-distance (a b)
  "Gets the difference in days between A weekday and the next B weekday.
A and B are given as numbers representing their positions in +weekdays+"
  (1+ (mod (- a b) 7)))

(defun meetup (month year weekday nth)
  (let ((first-occurr (weekday-distance
                       (position weekday +weekdays+)
                       (universal-time-component
                        (encode-universal-time 0 0 0 1 month year 0)
                        :day))))
    (ecase nth
      (:first (list year month first-occurr))
      (:second (list year month (+ 7 first-occurr)))
      (:third (list year month (+ 14 first-occurr)))
      (:fourth (list year month (+ 21 first-occurr)))
      (:fifth (list year month (+ 28 first-occurr)))
      (:last (if (valid-date-p (+ 28 first-occurr) month year)
                 (list year month (+ 28 first-occurr))
                 (list year month (+ 21 first-occurr))))
      (:teenth (list year month (if (>= (+ 14 first-occurr) 20)
                                    (+ 7 first-occurr)
                                    (+ 14 first-occurr)))))))
