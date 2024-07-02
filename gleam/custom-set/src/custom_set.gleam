import gleam/list

pub opaque type Set(t) {
  Set(elements: List(t))
}

pub fn new(members: List(t)) -> Set(t) {
  Set(list.unique(members))
}

pub fn is_empty(set: Set(t)) -> Bool {
  list.is_empty(set.elements)
}

pub fn contains(in set: Set(t), this member: t) -> Bool {
  list.contains(set.elements, member)
}

pub fn is_subset(first: Set(t), of second: Set(t)) -> Bool {
  list.all(first.elements, contains(second, _))
}

pub fn disjoint(first: Set(t), second: Set(t)) -> Bool {
  !list.any(first.elements, contains(second, _))
}

pub fn is_equal(first: Set(t), to second: Set(t)) -> Bool {
  is_subset(first, second) && is_subset(second, first)
}

pub fn add(to set: Set(t), this member: t) -> Set(t) {
  Set([member, ..set.elements])
}

pub fn intersection(of first: Set(t), and second: Set(t)) -> Set(t) {
  Set(list.filter(first.elements, contains(second, _)))
}

pub fn difference(between first: Set(t), and second: Set(t)) -> Set(t) {
  Set(list.filter(first.elements, fn(x) { !contains(second, x) }))
}

pub fn union(of first: Set(t), and second: Set(t)) -> Set(t) {
  Set(list.append(first.elements, second.elements))
}
