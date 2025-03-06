import gleam/int
import gleam/list

pub type Allergen {
  Eggs
  Peanuts
  Shellfish
  Strawberries
  Tomatoes
  Chocolate
  Pollen
  Cats
}

const allergen_scores = [
  #(Eggs, 1),
  #(Peanuts, 2),
  #(Shellfish, 4),
  #(Strawberries, 8),
  #(Tomatoes, 16),
  #(Chocolate, 32),
  #(Pollen, 64),
  #(Cats, 128),
]

pub fn allergic_to(allergen: Allergen, score: Int) -> Bool {
  let assert Ok(allergen_score) = list.key_find(allergen_scores, allergen)
  int.bitwise_and(score, allergen_score) > 0
}

pub fn list(score: Int) -> List(Allergen) {
  let #(allergens, _) = list.unzip(allergen_scores)
  list.filter(allergens, allergic_to(_, score))
}
