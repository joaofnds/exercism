class Luhn
  def self.valid?(numerical_string)
    digits = numerical_string.scan(/\d/).map(&:to_i)
    has_only_digits_and_spaces = numerical_string.chars.all? { /\d|\s/ =~ _1 }

    has_only_digits_and_spaces && new(digits).valid?
  end

  def valid?
    multiple_digits? && luhn_sum_divisble_by_10?
  end

  private

  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def multiple_digits?
    @digits.length > 1
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
