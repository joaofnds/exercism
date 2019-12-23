class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(max)
    (1...max).select { |n| multiple?(n) }.sum
  end

  private

  attr_reader :numbers

  def multiple?(a)
    numbers.select { |b| (a%b).zero? }.any?
  end
end
