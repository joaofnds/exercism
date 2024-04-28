import gleam/list
import gleam/string

pub fn reverse(value: String) -> String {
  value
  |> string.to_graphemes
  |> list.reverse
  |> string.concat
}
