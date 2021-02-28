(ns diamond)

(def alphabet (map char (range (int \A) (inc (int \Z)))))

(defn top-left [letters spaces]
  (map-indexed
   (fn [i letter]
     (map-indexed
      (fn [j space]
        (if (= j (- spaces i)) letter space))
      (repeat (inc spaces) \space)))
   letters))

(defn mirror [coll]
  (concat coll (rest (reverse coll))))

(defn diamond [bound]
  (let [letters (take-while #(<= (int %) (int bound)) alphabet)
        spaces (.indexOf letters bound)]
    (->> (top-left letters spaces)
         (map mirror)
         mirror
         (map (partial apply str)))))
