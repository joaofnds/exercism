class ResistorColorDuo
  COLORS_VALUES = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }.freeze

  def self.value((tens, ones))
    color_value(tens.to_sym) * 10 + color_value(ones.to_sym)
  end

  def self.color_value(color)
    COLORS_VALUES[color]
  end
end
