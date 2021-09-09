(ns cars-assemble)

(def cars-per-hour 221)

(defn success-rate [speed]
  (condp <= speed
    10 0.77
    9  0.8
    5  0.9
    1  1.0
    0.0))

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (* speed cars-per-hour (success-rate speed)))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
