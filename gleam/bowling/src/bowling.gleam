import gleam/bool
import gleam/int
import gleam/list

pub opaque type Frame {
  Frame(rolls: List(Int), bonus: List(Int))
}

pub type Game {
  Game(frames: List(Frame))
}

pub type Error {
  InvalidPinCount
  GameComplete
  GameNotComplete
}

pub fn roll(game: Game, pins: Int) -> Result(Game, Error) {
  use <- bool.guard(pins < 0 || pins > 10, Error(InvalidPinCount))

  case game.frames {
    [Frame([a], _), ..] if a + pins > 10 && a != 10 -> Error(InvalidPinCount)

    [Frame([10], _), Frame([10], f), ..rest] ->
      Ok(
        Game([
          Frame([pins], []),
          Frame([10], [pins]),
          Frame([10], [pins, ..f]),
          ..rest
        ]),
      )

    [Frame([10], bonus), ..rest] ->
      Ok(Game([Frame([pins], []), Frame([10], [pins, ..bonus]), ..rest]))

    [Frame([a], _), Frame([10], bonus), ..rest] ->
      Ok(Game([Frame([pins, a], []), Frame([10], [pins, ..bonus]), ..rest]))

    [Frame([a, b], _), ..rest] if a + b == 10 ->
      Ok(Game([Frame([pins], []), Frame([a, b], [pins]), ..rest]))

    [_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11] -> Error(GameComplete)
    [Frame([_, _], _), _2, _3, _4, _5, _6, _7, _8, _9, _10] ->
      Error(GameComplete)

    [Frame([a, b], bonus), ..rest] ->
      Ok(Game([Frame([pins], []), Frame([a, b], bonus), ..rest]))

    [Frame([a], bonus), ..rest] -> Ok(Game([Frame([a, pins], bonus), ..rest]))

    _ -> Ok(Game([Frame([pins], []), ..game.frames]))
  }
}

pub fn score(game: Game) -> Result(Int, Error) {
  use <- bool.guard(list.length(game.frames) < 10, Error(GameNotComplete))

  case game.frames {
    [Frame([_], _), Frame([10], _), _3, _4, _5, _6, _7, _8, _9, _10, _11] ->
      Error(GameNotComplete)
    [Frame([a, b], _), _1, _2, _3, _4, _5, _6, _7, _8, _9] if a + b == 10 ->
      Error(GameNotComplete)
    [Frame([10], _), _1, _2, _3, _4, _5, _6, _7, _8, _9] ->
      Error(GameNotComplete)
    _ -> Ok(sum_rolls(list.reverse(game.frames) |> list.take(10), 0))
  }
}

fn sum_rolls(frames: List(Frame), total: Int) -> Int {
  case frames {
    [] -> total
    [Frame(a, b), ..rest] -> sum_rolls(rest, total + int.sum(a) + int.sum(b))
  }
}
