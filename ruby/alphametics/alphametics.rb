class Board
  def matching_weights?
    return false unless possible?

    carry = 0

    columns.all? do |column|
      *terms, result = column

      sum = terms.sum + carry

      if sum > 9
        carry = sum / 10
        sum = sum % 10
      else
        carry = 0
      end

      sum == result
    end
  end

  private

  attr_reader :terms, :result, :weights, :columns

  def initialize(terms, result, weights)
    @terms = terms
    @result = result
    @weights = weights

    rows = terms.map { value_of _1 }.append(value_of(result))
    @columns = transpose(rows).reverse
  end

  def value_of(word)
    word.chars.map { weights[_1] }
  end

  def transpose(ary, fill_value = 0)
    len = ary.map(&:length).max

    ary.map { ensure_length(_1, len, fill_value) }.transpose
  end

  def ensure_length(ary, length, fill_value = 0)
    Array.new(ary).tap do |ary|
      ary.unshift(fill_value) while ary.length < length
    end
  end

  def possible?
    max_term_length = terms.map(&:length).max
    result_length = result.length

    if max_term_length > result_length
      false
    elsif result_length > max_term_length
      first_letter_weight = weights[result[0]]
      first_letter_weight != 0
    else
      true
    end
  end
end

class Alphametics
  def self.solve(puzzle)
    new(puzzle).solve
  end

  def solve
    weights = all_possible_weights

    matches = weights.filter do |weight|
      Board.new(terms, result, weight).matching_weights?
    end

    matches.first || {}
  end

  private

  TOKENS = {
    sum: '+',
    equal: '=='
  }.freeze
  private_constant :TOKENS

  attr_reader :terms, :result, :letters

  def initialize(puzzle)
    @terms, @result = puzzle_operands(puzzle)
    @letters = puzzle.upcase.scan(/\w/).uniq.sort
  end

  def puzzle_operands(puzzle)
    terms, result = puzzle.upcase.split(TOKENS[:equal])

    terms = terms.split(TOKENS[:sum]).each(&:strip!)
    result = result.strip!

    [terms, result]
  end

  def all_possible_weights
    board_size = letters.length

    (0..9).to_a.permutation(board_size).map { letters.zip(_1).to_h }
  end
end

if $PROGRAM_NAME == __FILE__
  puts Alphametics.solve('I + BB == ILL')
  puts ({ 'A' => 9, 'M' => 1, 'O' => 0, 'S' => 2 })
end
