import gleam/list
import gleam/string

fn build_line(line: Int, size: Int) {
  [
    list.repeat(" ", size - line),
    [int_to_letter(line + 65)],
    list.repeat(" ", size - { size - line }),
  ]
  |> list.concat
  |> mirror
  |> string.join("")
}

pub fn build(letter: String) -> String {
  let size = letter_to_int(letter) - 65
  list.range(0, size)
  |> list.map(build_line(_, size))
  |> mirror
  |> string.join("\n")
}

fn mirror(l: List(a)) -> List(a) {
  let assert [_, ..rest] = list.reverse(l)
  list.concat([l, rest])
}

fn letter_to_int(letter: String) -> Int {
  let assert [code] = string.to_utf_codepoints(letter)
  string.utf_codepoint_to_int(code)
}

fn int_to_letter(int: Int) -> String {
  let assert Ok(code) = string.utf_codepoint(int)
  string.from_utf_codepoints([code])
}
