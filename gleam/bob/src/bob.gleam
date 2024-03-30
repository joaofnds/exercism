import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  let is_silence = string.is_empty(remark)
  let is_question = string.ends_with(remark, "?")
  let is_yelling =
    string.uppercase(remark) == remark && string.lowercase(remark) != remark

  case 0 {
    _ if is_silence -> "Fine. Be that way!"
    _ if is_yelling && is_question -> "Calm down, I know what I'm doing!"
    _ if is_yelling -> "Whoa, chill out!"
    _ if is_question -> "Sure."
    _ -> "Whatever."
  }
}
