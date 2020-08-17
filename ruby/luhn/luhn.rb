class Luhn
  def self.valid?(numerical_string)
    new(numerical_string).valid?
  end

  def valid?
    multiple_digits? && luhn_sum_divisble_by_10?
  end

  private

  attr_reader :numerical_string

  def initialize(numerical_string)
    @numerical_string = numerical_string
  end

  def digits
    @digits ||= numerical_string.scan(/\d/).map(&:to_i)
  end

  def multiple_digits?
    numerical_string.gsub(' ', '').match?(/^\d{2,}$/)
  end

  def luhn_sum_divisble_by_10?
    luhn_sum.modulo(10).zero?
  end

  def luhn_sum
    evens, odds = digits.reverse.partition.each_with_index { |_, i| i.even? }
    evens.sum + odds.map { luhn_double _1 }.sum
  end

  def luhn_double(number)
    if number > 4
      2 * number - 9
    else
      2 * number
    end
  end
end
