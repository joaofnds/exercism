class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors
  end

  def to(max)
    (1...max).select { |n| factor?(n) }.sum
  end

  private

  attr_reader :divisors

  def factor?(number)
    divisors.any? { |divisor| (number % divisor).zero? }
  end
end
