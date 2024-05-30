import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  use scores, points, strings <- dict.fold(legacy, dict.new())
  use scores, letter <- list.fold(strings, scores)
  dict.insert(scores, string.lowercase(letter), points)
}
