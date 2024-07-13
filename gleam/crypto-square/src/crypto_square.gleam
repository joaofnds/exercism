import gleam/float
import gleam/int
import gleam/list
import gleam/regex
import gleam/result
import gleam/string

pub fn ciphertext(plaintext: String) -> String {
  let assert Ok(re) = regex.from_string("[^a-z0-9]")

  let normalized =
    plaintext
    |> string.lowercase
    |> regex.split(with: re)
    |> string.concat

  let len = string.length(normalized)
  let assert Ok(cols) =
    int.square_root(len)
    |> result.map(float.ceiling)
    |> result.map(float.truncate)

  let rows =
    int.to_float(len) /. int.to_float(cols)
    |> float.ceiling
    |> float.truncate

  normalized
  |> string.pad_right(rows * cols, " ")
  |> string.to_graphemes
  |> list.sized_chunk(cols)
  |> list.transpose
  |> list.map(string.concat)
  |> string.join(" ")
}
