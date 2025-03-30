import gleam/bool
import gleam/int
import gleam/list
import gleam/regex
import gleam/string

pub type Error {
  SyntaxError
  UnknownOperation
  ImpossibleOperation
}

pub fn answer(question: String) -> Result(Int, Error) {
  use <- bool.guard(
    string.starts_with(question, "Who") || string.ends_with(question, "cubed?"),
    Error(UnknownOperation),
  )

  let assert Ok(re) =
    regex.from_string(
      "^What is (-?\\d+)( (plus|minus|multiplied by|divided by) (-?\\d+))*\\?$",
    )

  use <- bool.guard(!regex.check(re, question), Error(SyntaxError))

  question
  |> string.replace("What is", "plus")
  |> string.replace(" by", "")
  |> string.drop_right(1)
  |> string.split(" ")
  |> list.sized_chunk(2)
  |> list.try_fold(0, fn(res, pair) {
    let assert [op, num_str] = pair
    let assert Ok(num) = int.parse(num_str)
    apply(res, num, op)
  })
}

fn apply(a: Int, b: Int, op: String) -> Result(Int, Error) {
  case op {
    "plus" -> Ok(a + b)
    "minus" -> Ok(a - b)
    "multiplied" -> Ok(a * b)
    "divided" if b == 0 -> Error(ImpossibleOperation)
    "divided" -> Ok(a / b)
    _ -> Error(SyntaxError)
  }
}
