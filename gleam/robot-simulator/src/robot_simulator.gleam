import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  list.fold(
    string.to_graphemes(instructions),
    create(direction, position),
    exec,
  )
}

fn exec(robot, cmd) {
  case cmd {
    "A" -> advance(robot)
    "L" -> turn_left(robot)
    "R" -> turn_right(robot)
    _ -> panic as "invalid command"
  }
}

fn advance(robot: Robot) {
  case robot.direction {
    North ->
      create(robot.direction, Position(robot.position.x, robot.position.y + 1))
    East ->
      create(robot.direction, Position(robot.position.x + 1, robot.position.y))
    South ->
      create(robot.direction, Position(robot.position.x, robot.position.y - 1))
    West ->
      create(robot.direction, Position(robot.position.x - 1, robot.position.y))
  }
}

fn turn_left(robot: Robot) {
  case robot.direction {
    North -> create(West, robot.position)
    East -> create(North, robot.position)
    South -> create(East, robot.position)
    West -> create(South, robot.position)
  }
}

fn turn_right(robot: Robot) {
  case robot.direction {
    North -> create(East, robot.position)
    East -> create(South, robot.position)
    South -> create(West, robot.position)
    West -> create(North, robot.position)
  }
}
