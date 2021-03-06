class Phrase
  private

  RE = REGULAR_EXPRESSION = {
    words_including_contraction: /\b[[:word:]']+\b/
  }.freeze

  private_constant :RE, :REGULAR_EXPRESSION

  def initialize(phrase)
    @words = phrase.downcase.scan(RE[:words_including_contraction])
  end

  attr_reader :words

  public

  def word_count
    words.tally
  end
end
