class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words
      .map(&:downcase)
      .each_with_object(Hash.new(0)) { |word, memo| memo[word] += 1 }
  end

  private

  attr_reader :phrase

  def words
    phrase.scan(/\b[[:word:]']+\b/)
  end
end
