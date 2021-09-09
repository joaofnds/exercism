(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [[first]]
  first)

(defn second-card
  "Returns the second card from deck."
  [[_ second]]
  second)

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [[first second & tail]]
  (apply vector second first tail))

(defn discard-top-card
  "Returns a vector containing the first card and
   a vector of the remaining cards in the deck."
  [[first & tail]]
  [first tail])

(def face-cards ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [[first & tail]]
  (remove nil? (flatten [first face-cards tail])))
