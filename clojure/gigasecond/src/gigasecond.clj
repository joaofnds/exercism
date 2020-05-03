(ns gigasecond
  (:import java.util.Calendar))

(defn to-calendar
  [year month day]
  (doto (Calendar/getInstance)
    (.clear)
    (.set year (dec month) day)))

(defn add-gigasecond
  [calendar]
  (doto calendar (.add Calendar/SECOND 1e9)))

(defn calendar-date-components
  [calendar]
  (vector (.get calendar Calendar/YEAR)
          (inc (.get calendar Calendar/MONTH))
          (.get calendar Calendar/DAY_OF_MONTH)))

(defn from
  [year month day]
  (-> (to-calendar year month day)
      add-gigasecond
      calendar-date-components))
