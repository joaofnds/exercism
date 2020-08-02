(ns allergies)

(def allergen->score
  {:eggs 0
   :peanuts 1
   :shellfish 2
   :strawberries 3
   :tomatoes 4
   :chocolate 5
   :pollen 6
   :cats 7})

(defn allergies [score]
  (keep
   (fn [[allergen i]]
     (when (bit-test score i) allergen))
   allergen->score))

(defn allergic-to? [score allergen]
  (bit-test score (allergen allergen->score)))
