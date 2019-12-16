class Squares
  def initialize(n)
    @series = (1..n)
  end

  def square_of_sum
    series.sum**2
  end

  def sum_of_squares
    series.map { |i| i**2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :series
end
