import gleam/list

pub fn factors(value: Int) -> List(Int) {
  factors_iter(value, 2, [])
}

fn factors_iter(n: Int, i: Int, factors: List(Int)) -> List(Int) {
  case n, n % i {
    1, _ -> list.reverse(factors)
    _, 0 -> factors_iter(n / i, i, [i, ..factors])
    _, _ -> factors_iter(n, i + 1, factors)
  }
}
