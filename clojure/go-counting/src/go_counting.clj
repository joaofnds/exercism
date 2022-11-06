(ns go-counting)

(def colors {\B :black \W :white})
(def names {:black :black-territory
            :white :white-territory
            nil    :null-territory})

(defn cords [raw]
  (for [y (range (count raw))
        x (range (count (first raw)))]
    [x y]))

(defn adjacents [grid [x y]]
  (select-keys grid [[x (dec y)] [x (inc y)] [(dec x) y] [(inc x) y]]))

(defn fill [grid stones [o & r :as owner] [xy & cs]]
  (if (not= \space (grid xy))
    {:stones stones :owner (when (and o (not r)) o)}
    (let [as (adjacents grid xy)]
      (recur (assoc grid xy \x)
             (conj stones xy)
             (into owner (keep colors (vals as)))
             (concat cs (filter #(= (as %) \space) (keys as)))))))

(defn parse [raw]
  (reduce #(assoc %1 %2 (get-in raw (reverse %2))) {} (cords raw)))

(defn territory [raw xy]
  {:pre [((parse raw) xy)]}
  (fill (parse raw) #{} #{} #{xy}))

(defn territories [raw]
  (reduce
   (fn [a t] (update a (names (:owner t)) into (:stones t)))
   (zipmap (vals names) (repeat #{}))
   (map #(territory raw %) (cords raw))))
