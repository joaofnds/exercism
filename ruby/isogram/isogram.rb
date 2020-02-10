class Isogram
  RE = REGULAR_EXPRESSION = {
    letter: /[a-zA-Z]/
  }.freeze

  def self.isogram?(input)
    new(input).isogram?
  end

  def isogram?
    letter_frequency.all? { |(key, value)| !letter?(key) || value == 1 }
  end

  private

  attr_reader :letter_frequency

  def initialize(input)
    @letter_frequency = input.downcase.chars.tally
  end

  def letter?(candidate)
    candidate.match(RE[:letter])
  end
end
