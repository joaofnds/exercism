class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    words.map(&:downcase).tally
  end

  private

  attr_reader :string

  def words
    string.scan(/\w+(?:'\w)*/)
  end
end
