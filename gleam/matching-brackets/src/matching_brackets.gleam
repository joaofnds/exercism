import gleam/string
import gleam/bool
import gleam/list

pub fn is_paired(input: String) -> Bool {
  input
  |> string.to_graphemes
  |> list.filter(string.contains("([{}])", _))
  |> is_paired_iter([])
}

fn is_paired_iter(input: List(String), stack: List(String)) -> Bool {
  use <- bool.guard(
    when: list.is_empty(input) && list.is_empty(stack),
    return: True,
  )
  use <- bool.guard(when: list.is_empty(input), return: False)

  let assert [char, ..rem_input] = input
  case char {
    "{" | "(" | "[" -> is_paired_iter(rem_input, [char, ..stack])
    _ ->
      case char, stack {
        "}", ["{", ..rem_stack] -> is_paired_iter(rem_input, rem_stack)
        ")", ["(", ..rem_stack] -> is_paired_iter(rem_input, rem_stack)
        "]", ["[", ..rem_stack] -> is_paired_iter(rem_input, rem_stack)
        _, _ -> False
      }
  }
}
