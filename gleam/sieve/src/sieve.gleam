import gleam/list

pub fn primes_up_to(upper_bound: Int) -> List(Int) {
  case upper_bound < 2 {
    True -> []
    False -> sieve(list.range(2, upper_bound), [])
  }
}

fn sieve(candidates: List(Int), primes: List(Int)) -> List(Int) {
  case candidates {
    [] -> list.reverse(primes)
    [x, ..xs] -> sieve(list.filter(xs, fn(n) { n % x != 0 }), [x, ..primes])
  }
}
