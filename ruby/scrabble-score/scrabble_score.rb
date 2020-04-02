# frozen_string_literal: true

class Scrabble
  LETTER_SCORE = {
    a: 1, e: 1, i: 1, o: 1, u: 1, l: 1, n: 1, r: 1, s: 1, t: 1,
    d: 2, g: 2,
    b: 3, c: 3, m: 3, p: 3,
    f: 4, h: 4, v: 4, w: 4, y: 4,
    k: 5,
    j: 8, x: 8,
    q: 10, z: 10
  }.transform_keys!(&:to_s)

  def self.score(word)
    new(word).score
  end

  private

  def initialize(word)
    @word = (word || '').downcase.chars
    @score = compute_score
  end

  private_constant :LETTER_SCORE

  attr_reader :word

  def compute_score
    word.sum { |letter| letter_score(letter) }
  end

  def letter_score(letter)
    LETTER_SCORE.fetch(letter, 0)
  end

  public

  attr_reader :score
end
