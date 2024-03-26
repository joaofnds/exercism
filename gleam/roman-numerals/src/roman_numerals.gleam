import gleam/list

const value_to_roman = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I"),
]

pub fn convert(number: Int) -> String {
  convert_iter(number, "")
}

fn convert_iter(remainder: Int, result: String) -> String {
  case list.find(value_to_roman, fn(pair) { remainder >= pair.0 }) {
    Ok(#(value, roman)) -> convert_iter(remainder - value, result <> roman)
    _ -> result
  }
}
