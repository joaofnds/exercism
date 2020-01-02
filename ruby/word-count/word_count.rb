class Phrase
  RE = {
    words_including_contraction: /\b[[:word:]']+\b/
  }.freeze

  private_constant :RE

  def initialize(phrase)
    @words = phrase.downcase.scan(RE[:words_including_contraction])
  end

  def word_count
    words.tally
  end

  private

  attr_reader :words
end
