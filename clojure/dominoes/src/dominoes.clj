(ns dominoes)

(defn- remove-first [seq x]
  (let [i (.indexOf seq x)]
    (concat (take i seq) (drop (inc i) seq))))

(defn- match [[_ b] [c d]]
  (condp = b
    c [c d]
    d [d c]
    nil))

(defn- backtrack [stones chain]
  (if (seq stones)
    (some #(some->> (match (last chain) %)
                    (conj chain)
                    (backtrack (remove-first stones %)))
          stones)
    (= (ffirst chain) (last (last chain)))))

(defn can-chain? [stones]
  (or (empty? stones)
      (some #(backtrack (remove-first stones %) [%]) stones)))
