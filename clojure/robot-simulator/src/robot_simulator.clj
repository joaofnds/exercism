(ns robot-simulator)

(defn robot [coordinates bearing]
  {:coordinates coordinates :bearing bearing})

(defn turn-right [bearing]
  (case bearing
    :north :east
    :east :south
    :south :west
    :west :north))

(defn turn-left [bearing]
  (case bearing
    :north :west
    :east :north
    :south :east
    :west :south))

(defn- letter->action [letter]
  (case letter
    \A :advance
    \L :turn-left
    \R :turn-right))

(defn- update-position [{:keys [coordinates bearing]} delta]
  (let [new-positon (merge-with + coordinates delta)]
    (robot new-positon bearing)))

(defn- move-left [{:keys [coordinates bearing]}]
  (robot coordinates (turn-left bearing)))

(defn- move-right [{:keys [coordinates bearing]}]
  (robot coordinates (turn-right bearing)))

(defn- advance [bot]
  (let [bearing (:bearing bot)]
    (case bearing
      :north (update-position bot {:x 0  :y  1})
      :south (update-position bot {:x 0  :y -1})
      :east  (update-position bot {:x 1  :y  0})
      :west  (update-position bot {:x -1 :y  0}))))

(defn- move [bot action]
  (case action
    :advance (advance bot)
    :turn-left (move-left bot)
    :turn-right (move-right bot)))

(defn simulate [actions bot]
  (reduce move bot (map letter->action actions)))
