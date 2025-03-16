import gleam/int
import gleam/list
import gleam/result

pub type Position {
  Position(row: Int, column: Int)
}

pub fn saddle_points(rows: List(List(Int))) -> List(Position) {
  let cols = list.transpose(rows)

  list.index_map(rows, fn(row, i) {
    list.index_map(cols, fn(col, j) {
      case list.reduce(row, int.max) == list.reduce(col, int.min) {
        True -> Ok(Position(i + 1, j + 1))
        False -> Error(Nil)
      }
    })
  })
  |> list.flatten
  |> result.values
}
