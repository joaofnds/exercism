import gleam/int
import gleam/list
import gleam/string

pub fn valid(value: String) -> Bool {
  let digits =
    value
    |> string.replace(" ", "")
    |> string.to_graphemes()
    |> list.try_map(int.parse)

  case digits {
    Ok(digits) -> list.length(digits) > 1 && luhn_sum(digits) % 10 == 0
    _ -> False
  }
}

fn luhn_sum(digits: List(Int)) -> Int {
  list.index_fold(list.reverse(digits), 0, fn(sum, n, index) {
    case int.is_odd(index), n * 2 {
      False, _ -> sum + n
      True, double if double <= 9 -> sum + double
      True, double -> sum + double - 9
    }
  })
}
