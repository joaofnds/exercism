import gleam/int
import gleam/list

pub fn rows(n: Int) -> List(List(Int)) {
  case n {
    0 -> []
    _ -> list.range(0, n - 1) |> list.map(row)
  }
}

fn fact(n: Int) -> Int {
  case n {
    0 -> 1
    _ -> int.product(list.range(1, n))
  }
}

fn n_choose_k(n: Int, k: Int) -> Int {
  fact(n) / { fact(k) * fact(n - k) }
}

fn row(n) -> List(Int) {
  list.map(list.range(0, n), n_choose_k(n, _))
}
