import gleam/result

pub type Error {
  InvalidBase(Int)
  InvalidDigit(Int)
}

pub fn rebase(
  digits input_digits: List(Int),
  input_base input_base: Int,
  output_base output_base: Int,
) -> Result(List(Int), Error) {
  input_digits
  |> undigits(input_base)
  |> result.try(digits(_, output_base))
}

fn undigits(numbers: List(Int), base: Int) -> Result(Int, Error) {
  case base < 2 {
    True -> Error(InvalidBase(base))
    False -> do_undigits(numbers, base, 0)
  }
}

fn do_undigits(numbers: List(Int), base: Int, acc: Int) -> Result(Int, Error) {
  case numbers {
    [] -> Ok(acc)
    [digit, ..] if digit >= base || digit < 0 -> Error(InvalidDigit(digit))
    [digit, ..rest] -> do_undigits(rest, base, acc * base + digit)
  }
}

fn digits(number: Int, base: Int) -> Result(List(Int), Error) {
  case base < 2 {
    True -> Error(InvalidBase(base))
    False -> Ok(do_digits(number, base, []))
  }
}

fn do_digits(number: Int, base: Int, acc: List(Int)) -> List(Int) {
  case number < base {
    True -> [number, ..acc]
    False -> do_digits(number / base, base, [number % base, ..acc])
  }
}
