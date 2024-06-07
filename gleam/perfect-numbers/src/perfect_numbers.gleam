import gleam/bool
import gleam/int
import gleam/list
import gleam/order.{Eq, Gt, Lt}

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  use <- bool.guard(number < 1, Error(NonPositiveInt))

  let aliquot_sum =
    list.range(1, number / 2)
    |> list.filter(fn(x) { number % x == 0 && x != number })
    |> int.sum

  case int.compare(aliquot_sum, number) {
    Gt -> Ok(Abundant)
    Lt -> Ok(Deficient)
    Eq -> Ok(Perfect)
  }
}
