# frozen_string_literal: true

class Raindrops
  def self.convert(number)
    new(number).speak
  end

  def speak
    speak_words = words
    if speak_words.empty?
      number.to_s
    else
      speak_words.join
    end
  end

  private

  FACTORS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  private_constant :FACTORS

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def factors
    FACTORS.keys.filter { (number % _1).zero? }
  end

  def words
    factors.map { FACTORS[_1] }
  end
end
