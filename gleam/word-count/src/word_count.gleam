import gleam/dict.{type Dict}
import gleam/list
import gleam/regex
import gleam/string

pub fn count_words(input: String) -> Dict(String, Int) {
  let assert Ok(re) = regex.from_string("\\w+('\\w+)?")

  input
  |> string.lowercase
  |> regex.scan(re, _)
  |> list.group(fn(match) { match.content })
  |> dict.map_values(fn(_, matches) { list.length(matches) })
}
