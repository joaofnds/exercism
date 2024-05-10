import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let have_mine = set.contains(collection, my_card)
  let have_theirs = set.contains(collection, their_card)
  let should_trade = have_mine && !have_theirs

  let collection_after_trade =
    collection
    |> set.insert(their_card)
    |> set.delete(my_card)

  #(should_trade, collection_after_trade)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(set.intersection)
  |> result.map(set.to_list)
  |> result.unwrap([])
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), set.union)
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.to_list
  |> list.filter(is_shiny)
  |> set.from_list
}

fn is_shiny(card: String) -> Bool {
  string.starts_with(card, "Shiny ")
}
