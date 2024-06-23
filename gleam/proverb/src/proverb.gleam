import gleam/list
import gleam/string

pub fn recite(inputs: List(String)) -> String {
  case inputs {
    [] -> ""
    [first, ..] ->
      list.window_by_2(inputs)
      |> list.map(fn(pair) {
        "For want of a " <> pair.0 <> " the " <> pair.1 <> " was lost.\n"
      })
      |> string.concat()
      |> string.append("And all for the want of a " <> first <> ".")
  }
}
