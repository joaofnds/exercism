(ns robot-name)

(def robot-name-letters "ABCDEFGHIJKLMNOPQRS")
(def robot-name-digits "0123456789")

(defn generate-name []
  (str
   (rand-nth robot-name-letters)
   (rand-nth robot-name-letters)
   (rand-nth robot-name-digits)
   (rand-nth robot-name-digits)
   (rand-nth robot-name-digits)))

(defn robot []
  (atom {:name (generate-name)}))

(defn robot-name [robot]
  (@robot :name))

(defn reset-name [robot]
  (swap! robot #(assoc % :name (generate-name))))
