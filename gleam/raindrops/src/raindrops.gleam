import gleam/int
import gleam/list
import gleam/string

pub fn convert(number: Int) -> String {
  let sounds =
    [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]
    |> list.filter(fn(pair) { number % pair.0 == 0 })
    |> list.map(fn(pair) { pair.1 })
    |> string.concat

  case sounds {
    "" -> int.to_string(number)
    _ -> sounds
  }
}
