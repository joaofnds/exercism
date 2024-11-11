import gleam/list

pub fn factors(value: Int) -> List(Int) {
  do_factors(value, 2, [])
}

fn do_factors(n: Int, i: Int, factors: List(Int)) -> List(Int) {
  case i <= n, n % i == 0 {
    False, _ -> factors
    _, True -> do_factors(n / i, i, list.append(factors, [i]))
    _, False -> do_factors(n, i + 1, factors)
  }
}
