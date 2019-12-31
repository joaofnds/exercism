class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words.map(&:downcase).tally
  end

  private

  attr_reader :phrase

  def words
    phrase.scan(/\b[[:word:]']+\b/)
  end
end
