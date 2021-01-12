(ns space-age)

(def orbital-seconds
  {:earth 31557600
   :mercury 7600543
   :venus 19414149
   :mars 59354032
   :jupiter 374355659
   :saturn 929292362
   :uranus 2651370019
   :neptune 5200418560})

(defn on-earth [seconds]
  (/ seconds (:earth orbital-seconds)))

(defn on-mercury [seconds]
  (/ seconds (:mercury orbital-seconds)))

(defn on-venus [seconds]
  (/ seconds (:venus orbital-seconds)))

(defn on-mars [seconds]
  (/ seconds (:mars orbital-seconds)))

(defn on-jupiter [seconds]
  (/ seconds (:jupiter orbital-seconds)))

(defn on-saturn [seconds]
  (/ seconds (:saturn orbital-seconds)))

(defn on-neptune [seconds]
  (/ seconds (:neptune orbital-seconds)))

(defn on-uranus [seconds]
  (/ seconds (:uranus orbital-seconds)))
