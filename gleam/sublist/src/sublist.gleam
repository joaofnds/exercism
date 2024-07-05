import gleam/bool
import gleam/list

pub type Comparison {
  Equal
  Unequal
  Sublist
  Superlist
}

pub fn sublist(compare a: List(a), to b: List(a)) -> Comparison {
  use <- bool.guard(a == b, Equal)
  use <- bool.guard(a == [] || contains(a, b), Sublist)
  use <- bool.guard(b == [] || contains(b, a), Superlist)
  Unequal
}

fn contains(a: List(a), b: List(a)) -> Bool {
  list.contains(list.window(b, list.length(a)), a)
}
