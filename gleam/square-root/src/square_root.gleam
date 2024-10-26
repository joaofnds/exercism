pub fn square_root(radicand: Int) -> Int {
  square_root_iter(radicand, 1)
}

fn square_root_iter(rad: Int, n: Int) -> Int {
  case n <= rad, n * n == rad {
    False, _ -> 0
    _, False -> square_root_iter(rad, n + 1)
    _, True -> n
  }
}
