class Triplet
  def self.where(min_factor: 3, max_factor:, sum: nil)
    all_combinations = (min_factor..max_factor).to_a.combination(3)
    all_triplets = all_combinations.map { |a, b, c| new(a, b, c) }
    pythagoreans = all_triplets.filter(&:pythagorean?)

    if sum
      pythagoreans.filter { |triplet| triplet.sum == sum }
    else
      pythagoreans
    end
  end

  def product
    a * b * c
  end

  def sum
    a + b + c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  private

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
end
