import gleam/int
import gleam/list
import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

const color_code = [
  #("black", 0), #("brown", 1), #("red", 2), #("orange", 3), #("yellow", 4),
  #("green", 5), #("blue", 6), #("violet", 7), #("grey", 8), #("white", 9),
]

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  colors
  |> list.map(list.key_find(color_code, _))
  |> result.all()
  |> result.try(resistance_from_codes)
  |> result.map(new)
}

fn resistance_from_codes(codes: List(Int)) -> Result(Int, Nil) {
  case codes {
    [tens, ones, multiplier, ..] ->
      [tens, ones, ..list.repeat(0, multiplier)]
      |> int.undigits(10)
      |> result.nil_error
    _ -> Error(Nil)
  }
}

fn new(resistance: Int) -> Resistance {
  case resistance {
    r if r >= 1_000_000_000 -> Resistance("gigaohms", r / 1_000_000_000)
    r if r >= 1_000_000 -> Resistance("megaohms", r / 1_000_000)
    r if r >= 1000 -> Resistance("kiloohms", r / 1000)
    r -> Resistance("ohms", r)
  }
}
