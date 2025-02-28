import gleam/list
import gleam/string

const map = [
  #("0", "0"),
  #("1", "1"),
  #("2", "2"),
  #("3", "3"),
  #("4", "4"),
  #("5", "5"),
  #("6", "6"),
  #("7", "7"),
  #("8", "8"),
  #("9", "9"),
  #("a", "z"),
  #("b", "y"),
  #("c", "x"),
  #("d", "w"),
  #("e", "v"),
  #("f", "u"),
  #("g", "t"),
  #("h", "s"),
  #("i", "r"),
  #("j", "q"),
  #("k", "p"),
  #("l", "o"),
  #("m", "n"),
  #("n", "m"),
  #("o", "l"),
  #("p", "k"),
  #("q", "j"),
  #("r", "i"),
  #("s", "h"),
  #("t", "g"),
  #("u", "f"),
  #("v", "e"),
  #("w", "d"),
  #("x", "c"),
  #("y", "b"),
  #("z", "a"),
]

pub fn encode(phrase: String) -> String {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter_map(fn(c) { list.key_find(map, string.lowercase(c)) })
  |> list.sized_chunk(5)
  |> list.map(string.concat)
  |> string.join(" ")
}

pub fn decode(phrase: String) -> String {
  phrase
  |> string.to_graphemes
  |> list.filter_map(fn(c) { list.key_find(map, string.lowercase(c)) })
  |> string.concat
}
