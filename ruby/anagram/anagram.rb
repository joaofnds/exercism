class Anagram
  def initialize(word)
    @word = Anagram.normalized_case(word)
    @chars = Anagram.sorted_chars(@word)
  end

  def self.normalized_case(str)
    str.downcase
  end

  def self.sorted_chars(str)
    str.chars.sort
  end

  def match(candidates)
    candidates.select { |candidate| anagram?(candidate) }
  end

  private

  attr_reader :word, :chars

  def anagram?(candidate)
    candidate = Anagram.normalized_case(candidate)

    return false if candidate == word # words are not anagrams of themselves

    Anagram.sorted_chars(candidate) == chars
  end
end
