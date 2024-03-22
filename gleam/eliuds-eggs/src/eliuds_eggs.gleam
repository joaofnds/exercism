import gleam/int
import gleam/result

pub fn egg_count(number: Int) -> Int {
  int.digits(number, 2)
  |> result.unwrap([])
  |> int.sum
}
