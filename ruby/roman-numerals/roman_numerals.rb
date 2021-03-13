# (def value->roman
class RomanConverter
  ROMANS = [[1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'],
            [100,  'C'], [90,  'XC'], [50,  'L'], [40,  'XL'],
            [10,   'X'], [9,   'IX'], [5,   'V'], [4,   'IV'],
            [1,    'I']]

  def result
    output = ''
    n = number

    while true
      value, roman = closest_roman(n)
      break if value.nil?

      output += roman
      n -= value
    end

    output
  end

  private

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def closest_roman(num)
    ROMANS.find { |roman, _decimal| num >= roman }
  end
end

class Integer
  def to_roman
    RomanConverter.new(self).result
  end
end
