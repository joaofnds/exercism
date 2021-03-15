class Robot
  attr_reader :bearing, :coordinates

  BEARINGS = %i[north east south west]

  def turn_right
    current_index = BEARINGS.find_index(bearing)
    next_index = (current_index + 1) % BEARINGS.size
    next_bearing = BEARINGS[next_index]

    orient(next_bearing)
  end

  def turn_left
    current_index = BEARINGS.find_index(bearing)
    next_index = (current_index - 1) % BEARINGS.size
    next_bearing = BEARINGS[next_index]

    orient(next_bearing)
  end

  def orient(bearing)
    raise ArgumentError unless BEARINGS.include? bearing

    @bearing = bearing
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    x, y = coordinates

    case bearing
    when :east
      x += 1
    when :west
      x -= 1
    when :north
      y += 1
    when :south
      y -= 1
    end

    at(x, y)
  end

  private

  def initialize
    @coordinates = [0, 0]
  end
end

class Simulator
  def instructions(commands)
    commands.chars.map { command_to_instruction _1 }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, commands)
    instructions(commands).each { robot.send _1 }
  end

  private

  def command_to_instruction(code)
    {
      'L' => :turn_left,
      'R' => :turn_right,
      'A' => :advance
    }[code]
  end
end
