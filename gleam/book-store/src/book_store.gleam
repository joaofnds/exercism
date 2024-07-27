import gleam/dict
import gleam/float
import gleam/int
import gleam/list

pub fn lowest_price(books: List(Int)) -> Float {
  books
  |> list.group(fn(n) { n })
  |> dict.values
  |> list.map(list.length)
  |> price(0.0)
}

fn price(books: List(Int), sum: Float) -> Float {
  let books =
    books
    |> list.filter(fn(n) { n > 0 })
    |> list.sort(int.compare)
    |> list.map(int.subtract(_, 1))

  case books {
    [a] -> sum +. int.to_float(a + 1) *. 800.0
    [_, _] -> price(books, sum +. 2.0 *. 760.0)
    [_, _, _] -> price(books, sum +. 3.0 *. 720.0)
    [_, _, _, _] -> price(books, sum +. 4.0 *. 640.0)
    [a, ..rest] ->
      float.min(
        price(books, sum +. 5.0 *. 600.0),
        price([a + 1, ..rest], sum +. 4.0 *. 640.0),
      )
    _ -> sum
  }
}
