class Darts
  def score
    return 10 if inner_circle?
    return 5 if middle_circle?
    return 1 if outer_circle?

    0
  end

  private

  def initialize(x, y)
    @distance_from_center = Math.hypot(x, y)
  end

  def outer_circle?
    @distance_from_center <= 10 && @distance_from_center > 5
  end

  def middle_circle?
    @distance_from_center <= 5 && @distance_from_center > 1
  end

  def inner_circle?
    @distance_from_center.between?(0, 1)
  end

  attr_reader :distance_from_center
end
