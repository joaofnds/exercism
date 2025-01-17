import gleam/list
import gleam/string

pub fn recite(
  start_bottles start_bottles: Int,
  take_down take_down: Int,
) -> String {
  list.range(start_bottles, start_bottles - take_down + 1)
  |> list.map(verse)
  |> string.join("\n\n")
}

fn verse(num: Int) -> String {
  let opening = string.capitalise(bottles(num)) <> " hanging on the wall,\n"

  opening
  <> opening
  <> "And if one green bottle should accidentally fall,\nThere'll be "
  <> bottles(num - 1)
  <> " hanging on the wall."
}

fn bottles(count: Int) -> String {
  to_cardinal(count) <> " green " <> pluralize(count, "bottle")
}

fn pluralize(count: Int, word: String) -> String {
  case count != 1 {
    True -> word <> "s"
    _ -> word
  }
}

fn to_cardinal(count: Int) -> String {
  case count {
    0 -> "no"
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"
    10 -> "ten"
    _ -> ""
  }
}
