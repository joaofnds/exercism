(ns beer-song
  (:require [clojure.pprint :refer [cl-format]]
            [clojure.string :as string]))

(def verse-format
  "~[No more~:;~:*~d~] bottle~:p of beer on the wall, ~:*~[no more~:;~:*~d~] bottle~:p of beer.
~:*~[Go to the store and buy some more, 99 bottles of beer on the wall~:;~
     Take ~[it~:;one~] down and pass it around, ~:*~[no more~:;~:*~d~] bottle~:p of beer on the wall~].~%")


(defn verse
  "Returns the nth verse of the song."
  [num]
  (cl-format nil verse-format num (dec num)))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end]
   (->>
    (range start (dec end) -1)
    (map verse)
    (string/join "\n"))))
