# frozen_string_literal: true

class Grains
  MIN_SQUARE = 1
  MAX_SQUARE = 64

  private_constant :MIN_SQUARE, :MAX_SQUARE

  def self.square(square_number)
    raise BoardSquareError unless valid_board_square?(square_number)

    1 << (square_number - 1)
  end

  def self.total
    # as each square doubles, the total amount of grains on the board is
    # always one less than the grains that would be in the next square
    square(MAX_SQUARE) * 2 - 1
  end

  def self.valid_board_square?(square_number)
    MIN_SQUARE <= square_number && square_number <= MAX_SQUARE
  end
end

class BoardSquareError < ArgumentError
  def message
    'not a valid board square number'
  end
end
