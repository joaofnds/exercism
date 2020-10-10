class Robot
  @@letters = ('A'..'Z').to_a.repeated_permutation(2).map(&:join).to_a
  @@numbers = (0..9).to_a.repeated_permutation(3).map(&:join).to_a
  @@generated_names = []

  attr_reader :name

  def self.forget
    @@generated_names = []
  end

  def generate_name
    prefix_index = @@generated_names.size.div(@@numbers.size).modulo(@@letters.size)
    prefix = @@letters[prefix_index]

    sufix_index = @@generated_names.size.remainder(@@numbers.size)
    sufix = @@numbers[sufix_index]

    new_name = prefix + sufix
    @@generated_names << new_name

    new_name
  end

  def reset
    @name = generate_name
  end

  private

  def initialize
    @name = generate_name
  end
end
