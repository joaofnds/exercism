pub fn score(x: Float, y: Float) -> Int {
  case x *. x +. y *. y {
    distance if distance <=. 1.0 -> 10
    distance if distance <=. 25.0 -> 5
    distance if distance <=. 100.0 -> 1
    _ -> 0
  }
}
