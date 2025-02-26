import gleam/int
import gleam/list
import gleam/string

pub fn is_valid(isbn: String) -> Bool {
  isbn
  |> string.to_graphemes
  |> list.reverse
  |> check(1, 0)
}

fn check(letters: List(String), multiplier: Int, sum: Int) -> Bool {
  case letters {
    [] if multiplier == 11 -> sum % 11 == 0
    [] -> False
    ["-", ..tail] -> check(tail, multiplier, sum)
    ["X", ..tail] if multiplier == 1 -> check(tail, multiplier + 1, sum + 10)
    [letter, ..tail] ->
      case int.parse(letter) {
        Ok(digit) -> check(tail, multiplier + 1, sum + multiplier * digit)
        Error(_) -> False
      }
  }
}
