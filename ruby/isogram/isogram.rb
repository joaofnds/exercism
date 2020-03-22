class Isogram
  def self.isogram?(phrase)
    new(phrase).isogram?
  end

  private

  # tokenizer receives the phrase and expects an Enumerable back
  def initialize(phrase, tokenizer: method(:normalize), &block)
    @tokens = (block || tokenizer).call(phrase)
  end

  attr_reader :tokens

  def normalize(phrase)
    phrase.downcase.scan(/[[:alpha:]]/)
  end

  public

  def isogram?
    # An isogram is a word or phrase without a repeating letter.
    # If we take the unique letters of the phrase and it is shorter
    # than the original group of letters, some letter was repeated.
    # If the length stays the same, we've got an isogram
    tokens.uniq.length == tokens.length
  end
end
