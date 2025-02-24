import gleam/list
import gleam/string

pub fn abbreviate(phrase phrase: String) -> String {
  phrase
  |> string.replace("-", " ")
  |> string.replace("_", " ")
  |> string.split(" ")
  |> list.filter_map(string.first)
  |> string.concat
  |> string.uppercase
}
