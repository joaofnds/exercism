import gleam/int
import gleam/result
import gleam/string

pub fn encode(plaintext: String) -> String {
  case string.pop_grapheme(plaintext) {
    Error(Nil) -> ""
    Ok(#(char, rest)) -> do_encode(rest, char, 1, "")
  }
}

fn do_encode(text: String, prev: String, count: Int, encoded: String) -> String {
  case string.pop_grapheme(text) {
    Error(Nil) -> encoded <> count_str(count) <> prev

    Ok(#(letter, rest)) if letter == prev ->
      do_encode(rest, prev, count + 1, encoded)

    Ok(#(letter, rest)) ->
      do_encode(rest, letter, 1, encoded <> count_str(count) <> prev)
  }
}

fn count_str(count: Int) {
  case count {
    1 -> ""
    _ -> int.to_string(count)
  }
}

pub fn decode(ciphertext: String) -> String {
  do_decode(ciphertext, "", "")
}

fn do_decode(ciphertext: String, decoded: String, number_str: String) -> String {
  case string.pop_grapheme(ciphertext) {
    Error(Nil) -> decoded

    Ok(#(char, rest)) -> {
      case string.contains("012345689", char) {
        True -> do_decode(rest, decoded, number_str <> char)
        False ->
          int.parse(number_str)
          |> result.unwrap(1)
          |> string.repeat(char, _)
          |> string.append(decoded, _)
          |> do_decode(rest, _, "")
      }
    }
  }
}
