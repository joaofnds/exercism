class Phrase
  private

  RE = {
    words_including_contraction: /\b[[:word:]']+\b/
  }.freeze

  private_constant :RE

  def initialize(phrase)
    @words = phrase.downcase.scan(RE[:words_including_contraction])
  end

  attr_reader :words

  public

  def word_count
    words.tally
  end
end
