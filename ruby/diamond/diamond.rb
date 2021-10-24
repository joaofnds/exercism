class Diamond
  def self.make_diamond(letter)
    new(letter).make
  end

  def make
    mirror(top_left.map { mirror _1 }).join("\n") + "\n"
  end

  private

  ALPHABET = ('A'..'Z').to_a

  private_constant :ALPHABET
  attr_reader :letter, :size

  def initialize(letter)
    @letter = letter
    @size = ALPHABET.find_index(letter)
  end

  def top_left
    ALPHABET
      .take_while { _1 <= letter }
      .each_with_index
      .map { |l, i| ' ' * (size - i) + l + ' ' * i }
  end

  def mirror(arr)
    arr + arr.reverse[1..-1]
  end
end
