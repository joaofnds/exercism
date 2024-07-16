import gleam/dict
import gleam/list
import gleam/result
import gleam/string

pub fn rotate(shift_key: Int, text: String) -> String {
  let alphabet = string.to_graphemes("abcdefghijklmnopqrstuvwxyz")

  let cipher_map =
    list.drop(alphabet, shift_key)
    |> list.append(list.take(alphabet, shift_key))
    |> list.zip(alphabet, _)
    |> list.flat_map(fn(x) {
      [x, #(string.uppercase(x.0), string.uppercase(x.1))]
    })
    |> dict.from_list

  text
  |> string.to_graphemes
  |> list.map(fn(char) { result.unwrap(dict.get(cipher_map, char), char) })
  |> string.concat
}
