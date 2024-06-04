import gleam/bool
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn largest_product(digits: String, span: Int) -> Result(Int, Nil) {
  use <- bool.guard(span < 0 || string.length(digits) < span, Error(Nil))
  use <- bool.guard(digits == "" || span == 0, Ok(1))

  digits
  |> string.to_graphemes
  |> list.try_map(int.parse)
  |> result.map(list.window(_, span))
  |> result.map(list.map(_, int.product))
  |> result.map(list.fold(_, 0, int.max))
}
