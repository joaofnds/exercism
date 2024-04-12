import gleam/string
import gleam/list

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letters =
    phrase
    |> string.lowercase()
    |> string.replace(" ", "")
    |> string.replace("-", "")
    |> string.to_graphemes()

  list.unique(letters) == letters
}
