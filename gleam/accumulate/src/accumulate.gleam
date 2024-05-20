pub fn accumulate(list: List(a), f: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [head, ..tail] -> [f(head), ..accumulate(tail, f)]
  }
}
