import gleam/bool
import gleam/int.{absolute_value as abs}

pub type Position {
  Position(row: Int, column: Int)
}

pub type Error {
  RowTooSmall
  RowTooLarge
  ColumnTooSmall
  ColumnTooLarge
}

pub fn create(queen quenn: Position) -> Result(Nil, Error) {
  use <- bool.guard(quenn.row < 0, Error(RowTooSmall))
  use <- bool.guard(quenn.row > 7, Error(RowTooLarge))
  use <- bool.guard(quenn.column < 0, Error(ColumnTooSmall))
  use <- bool.guard(quenn.column > 7, Error(ColumnTooLarge))
  Ok(Nil)
}

pub fn can_attack(
  black_queen black: Position,
  white_queen white: Position,
) -> Bool {
  black.row == white.row
  || black.column == white.column
  || abs(black.row - white.row) == abs(black.column - white.column)
}
