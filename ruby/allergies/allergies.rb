class Allergies
  ALLERGEN_BIT = {
    0 => 'eggs',
    1 => 'peanuts',
    2 => 'shellfish',
    3 => 'strawberries',
    4 => 'tomatoes',
    5 => 'chocolate',
    6 => 'pollen',
    7 => 'cats'
  }

  def allergic_to?(food)
    allergies.include?(food)
  end

  def list
    allergies
  end

  private

  attr_reader :allergies

  def initialize(type)
    allergies = []
    type.bit_length.downto(0) do |i|
      allergies << ALLERGEN_BIT[i] if type[i] == 1
    end
    @allergies = allergies.reject(&:nil?)
  end
end
