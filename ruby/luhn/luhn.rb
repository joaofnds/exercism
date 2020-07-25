class Luhn
  def self.valid?(numerical_string)
    new(numerical_string).valid?
  end

  def valid?
    return false unless input_is_valid

    luhn_sum.modulo(10).zero?
  end

  private

  attr_reader :numbers, :input_is_valid

  def initialize(numerical_string)
    @input_is_valid = validate_input(numerical_string)
    @numbers = sanitize(numerical_string)
  end

  def validate_input(raw_input)
    raw_input.gsub!(' ', '')
    raw_input.length > 1 && raw_input.chars.all? { /\d/ =~ _1 }
  end

  def sanitize(numerical_string)
    string_without_spaces = numerical_string.gsub(' ', '')
    string_without_spaces.chars.map(&:to_i)
  end

  def luhn_double(number)
    if number > 4
      2 * number - 9
    else
      2 * number
    end
  end

  def luhn_sum
    evens, odds = numbers.reverse.partition.each_with_index { |_, i| i.even? }
    evens.sum + odds.map { luhn_double _1 }.sum
  end
end
