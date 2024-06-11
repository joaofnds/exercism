import gleam/list
import gleam/option.{Some}
import gleam/regex.{Match}
import gleam/string

pub fn translate(phrase: String) -> String {
  let assert Ok(re) =
    regex.from_string("([^aeiouxyq]*(?:qu|q|x|y)?)([aeiouxy]\\w*)")

  phrase
  |> string.split(" ")
  |> list.map(fn(word) {
    let assert [Match(_, submatches: [pre, Some(rem)])] = regex.scan(re, word)
    rem <> option.unwrap(pre, "") <> "ay"
  })
  |> string.join(" ")
}
