import gleam/list
import gleam/result

pub opaque type CircularBuffer(t) {
  CircularBuffer(cap: Int, items: List(t))
}

pub fn new(capacity: Int) -> CircularBuffer(t) {
  CircularBuffer(capacity, [])
}

pub fn read(buf: CircularBuffer(t)) -> Result(#(t, CircularBuffer(t)), Nil) {
  case buf.items {
    [first, ..rest] -> Ok(#(first, CircularBuffer(buf.cap, rest)))
    _ -> Error(Nil)
  }
}

pub fn write(buf: CircularBuffer(t), item: t) -> Result(CircularBuffer(t), Nil) {
  case list.length(buf.items) >= buf.cap {
    True -> Error(Nil)
    False -> Ok(CircularBuffer(buf.cap, list.append(buf.items, [item])))
  }
}

pub fn overwrite(buf: CircularBuffer(t), item: t) -> CircularBuffer(t) {
  use <- result.lazy_unwrap(write(buf, item))

  let items = list.drop(buf.items, 1) |> list.append([item])
  CircularBuffer(buf.cap, items)
}

pub fn clear(buf: CircularBuffer(t)) -> CircularBuffer(t) {
  CircularBuffer(buf.cap, [])
}
