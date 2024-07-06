import gleam/list

pub type Triplet {
  Triplet(a: Int, b: Int, c: Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  use a <- list.flat_map(list.range(3, sum / 3))
  use b <- list.filter_map(list.range(a + 1, { sum - a } / 2))
  let c = sum - a - b

  case a * a + b * b == c * c {
    True -> Ok(Triplet(a, b, c))
    False -> Error(Nil)
  }
}
