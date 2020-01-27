class ResistorColorTrio
  class ResistorColorError < ArgumentError; end

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def label
    if ohms > 1000
      "Resistor value: #{ohms / 1000} kiloohms"
    else
      "Resistor value: #{ohms} ohms"
    end
  end

  private

  attr_reader :colors, :ohms

  def initialize(colors)
    @colors = colors
    assert_resistor_colors

    @ohms = resistance
  end

  def color_code(color)
    COLORS.index color
  end

  def resistance
    power = 10**color_code(colors.last)

    first_color_value = color_code(colors[0]) * 10
    second_color_value = color_code(colors[1])

    (first_color_value + second_color_value) * power
  end

  def assert_resistor_colors
    all_colors_have_codes = colors.all? { color_code _1 }

    raise ResistorColorError unless all_colors_have_codes
  end
end
