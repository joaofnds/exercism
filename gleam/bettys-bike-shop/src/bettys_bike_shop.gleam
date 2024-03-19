import gleam/int
import gleam/float

pub fn pence_to_pounds(pence) -> Float {
  int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds) -> String {
  "£" <> float.to_string(pounds)
}
