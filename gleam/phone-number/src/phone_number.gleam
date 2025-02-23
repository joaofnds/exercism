import gleam/bool
import gleam/regex
import gleam/string

pub fn clean(input: String) -> Result(String, String) {
  let assert Ok(re_letter) = regex.from_string("[a-zA-Z]")
  use <- bool.guard(
    regex.check(re_letter, input),
    Error("letters not permitted"),
  )

  let assert Ok(re_punct) = regex.from_string("[@:!]")
  use <- bool.guard(
    regex.check(re_punct, input),
    Error("punctuations not permitted"),
  )

  let assert Ok(re_non_digit) = regex.from_string("\\D")
  let number = regex.replace(re_non_digit, input, "")
  let digit_count = string.length(number)

  use <- bool.guard(digit_count < 10, Error("must not be fewer than 10 digits"))
  use <- bool.guard(
    digit_count > 11,
    Error("must not be greater than 11 digits"),
  )
  use <- bool.guard(
    digit_count == 11 && !string.starts_with(number, "1"),
    Error("11 digits must start with 1"),
  )

  let number = case digit_count, number {
    11, "1" <> rest -> rest
    _, _ -> number
  }

  let area_code = string.slice(number, 0, 3)
  use <- bool.guard(
    string.starts_with(area_code, "0"),
    Error("area code cannot start with zero"),
  )
  use <- bool.guard(
    string.starts_with(area_code, "1"),
    Error("area code cannot start with one"),
  )

  let exchange_code = string.slice(number, 3, 3)
  use <- bool.guard(
    string.starts_with(exchange_code, "0"),
    Error("exchange code cannot start with zero"),
  )
  use <- bool.guard(
    string.starts_with(exchange_code, "1"),
    Error("exchange code cannot start with one"),
  )

  Ok(number)
}
