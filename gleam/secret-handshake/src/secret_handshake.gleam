import gleam/int
import gleam/list

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

const rules = [
  #(0b1000, Jump), #(0b0100, CloseYourEyes), #(0b0010, DoubleBlink), #(0b0001, Wink),
]

pub fn commands(encoded_message: Int) -> List(Command) {
  case int.bitwise_and(0b10000, encoded_message) {
    0 -> rules
    _ -> list.reverse(rules)
  }
  |> list.fold([], fn(acc, rule) {
    case int.bitwise_and(rule.0, encoded_message) {
      0 -> acc
      _ -> [rule.1, ..acc]
    }
  })
}
