import gleam/list
import gleam/result
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  list.strict_zip(string.to_graphemes(strand1), string.to_graphemes(strand2))
  |> result.map(list.filter(_, fn(zip: #(String, String)) { zip.0 != zip.1 }))
  |> result.map(list.length)
}
