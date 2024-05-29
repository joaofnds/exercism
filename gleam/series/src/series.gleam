import gleam/bool
import gleam/list
import gleam/string

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  use <- bool.guard(size < 0, Error(SliceLengthNegative))
  use <- bool.guard(size == 0, Error(SliceLengthZero))
  use <- bool.guard(string.length(input) == 0, Error(EmptySeries))
  use <- bool.guard(size > string.length(input), Error(SliceLengthTooLarge))

  list.range(0, string.length(input) - size)
  |> list.map(string.slice(input, _, size))
  |> Ok
}

pub type Error {
  SliceLengthNegative
  SliceLengthTooLarge
  SliceLengthZero
  EmptySeries
}
