(ns grains)

(defn square [n]
  (.shiftLeft (BigInteger/ONE) (dec n)))

(defn total []
  (dec (square 65)))
