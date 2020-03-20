class Isogram
  RE = REGULAR_EXPRESSION = {
    letter: /[[:alpha:]]/
  }.freeze

  def self.isogram?(word)
    new(word).isogram?
  end

  def isogram?
    letter_frequency.none? { |(letter, freq)| letter?(letter) && freq != 1 }
  end

  private

  attr_reader :letter_frequency

  def initialize(word)
    @letter_frequency = word.downcase.chars.tally
  end

  def letter?(candidate)
    candidate.match(RE[:letter])
  end
end
