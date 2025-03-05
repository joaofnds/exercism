import gleam/bool
import gleam/int
import gleam/list
import gleam/order
import gleam/result

pub type Error {
  ImpossibleTarget
}

pub fn find_fewest_coins(
  coins: List(Int),
  target: Int,
) -> Result(List(Int), Error) {
  coins
  |> list.sort(order.reverse(int.compare))
  |> do_change(target, [], Error(ImpossibleTarget))
}

fn do_change(
  coins: List(Int),
  target: Int,
  current: List(Int),
  best: Result(List(Int), Error),
) -> Result(List(Int), Error) {
  use <- bool.guard(
    best
      |> result.map(fn(b) { list.length(b) <= list.length(current) })
      |> result.unwrap(False),
    best,
  )

  case list.filter(coins, fn(c) { c <= target }), target {
    _, 0 -> Ok(current)
    [], _ -> best
    [coin, ..rest], _ ->
      do_change(coins, target - coin, [coin, ..current], best)
      |> do_change(rest, target, current, _)
  }
}
