class Triangle
  def initialize(sides)
    @a, @b, @c = sides
  end

  def equilateral?
    !illogical? && a == b && b == c
  end

  def isosceles?
    !illogical? && (a == b || b == c || a == c)
  end

  def scalene?
    !illogical? && a != b && b != c && a != c
  end

  private

  attr_reader :a, :b, :c

  def illogical?
    a >= (b + c) || b >= (a + c) || c >= (a + b)
  end
end
