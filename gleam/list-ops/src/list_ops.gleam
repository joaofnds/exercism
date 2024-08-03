pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldr(first, second, fn(acc, a) { [a, ..acc] })
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(lists, [], append)
}

pub fn filter(list: List(a), f: fn(a) -> Bool) -> List(a) {
  foldr(list, [], fn(acc, a) {
    case f(a) {
      True -> [a, ..acc]
      False -> acc
    }
  })
}

pub fn length(list: List(a)) -> Int {
  foldl(list, 0, fn(acc, _) { acc + 1 })
}

pub fn map(list: List(a), f: fn(a) -> b) -> List(b) {
  foldr(list, [], fn(acc, a) { [f(a), ..acc] })
}

pub fn foldl(over list: List(a), from acc: b, with f: fn(b, a) -> b) -> b {
  case list {
    [] -> acc
    [head, ..tail] -> foldl(tail, f(acc, head), f)
  }
}

pub fn foldr(over list: List(a), from acc: b, with f: fn(b, a) -> b) -> b {
  foldl(reverse(list), acc, f)
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(list, [], fn(acc, a) { [a, ..acc] })
}
