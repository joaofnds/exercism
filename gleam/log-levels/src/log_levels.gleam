import gleam/string

pub fn message(log_line: String) -> String {
  parse(log_line).1
}

pub fn log_level(log_line: String) -> String {
  parse(log_line).0
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}

fn parse(log_line: String) -> #(String, String) {
  let assert [level, message] =
    log_line
    |> string.drop_left(1)
    |> string.split("]:")

  #(string.lowercase(level), string.trim(message))
}
