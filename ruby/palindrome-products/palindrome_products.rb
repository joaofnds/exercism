Palindrome = Struct.new(:value, :factors) do
  def palindrome?
    digits = value.digits

    digits == digits.reverse
  end
end

class Palindromes
  def generate
    @palindromes = products.values.filter(&:palindrome?)
  end

  def smallest
    @smallest ||= palindromes.min_by(&:value)
  end

  def largest
    @largest ||= palindromes.max_by(&:value)
  end

  private

  attr_reader :min, :max, :palindromes

  def initialize(min_factor: 1, max_factor:)
    @min = min_factor
    @max = max_factor
  end

  def factors
    @factors ||= (min..max).to_a.repeated_combination(2)
  end

  def products
    @products ||= generate_products
  end

  def generate_products
    factors.each_with_object({}) do |factor, products|
      value = factor.reduce(&:*)

      (products[value] ||= Palindrome.new(value, [])).factors << factor
    end
  end
end
