pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number > 0 {
    True -> Ok(collatz(number, 0))
    False -> Error(NonPositiveNumber)
  }
}

fn collatz(number: Int, step: Int) -> Int {
  case number, number % 2 == 0 {
    1, _ -> step
    _, True -> collatz(number / 2, step + 1)
    _, False -> collatz(3 * number + 1, step + 1)
  }
}
