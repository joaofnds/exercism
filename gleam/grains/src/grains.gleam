import gleam/bool
import gleam/int

pub type Error {
  InvalidSquare
}

pub fn square(x: Int) -> Result(Int, Error) {
  use <- bool.guard(x < 1 || x > 64, Error(InvalidSquare))
  Ok(int.bitwise_shift_left(1, x - 1))
}

pub fn total() -> Int {
  int.bitwise_shift_left(1, 64) - 1
}
