pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  steps_iter(number, 0)
}

fn steps_iter(number: Int, step: Int) -> Result(Int, Error) {
  case number % 2 == 0 {
    _ if number == 1 -> Ok(step)
    _ if number <= 0 -> Error(NonPositiveNumber)
    True -> steps_iter(number / 2, step + 1)
    False -> steps_iter(3 * number + 1, step + 1)
  }
}
