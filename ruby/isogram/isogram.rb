class Isogram
  RE = REGULAR_EXPRESSION = {
    letter: /[[:alpha:]]/
  }

  def self.isogram?(phrase)
    new(phrase).isogram?
  end

  private

  def initialize(phrase, token_extractor = method(:downcased_letters))
    @tokens = token_extractor.call(phrase)
  end

  attr_reader :tokens

  def downcased_letters(phrase)
    phrase.downcase.scan(RE[:letter])
  end

  public

  def isogram?
    tokens.uniq.length == tokens.length
  end
end
