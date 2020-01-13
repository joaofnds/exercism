# frozen_string_literal: true

class Raindrops
  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(number)
    new(number).to_s
  end

  def to_s
    sound.to_s
  end

  private

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def factors
    RULES.keys.filter { |factor| (number % factor).zero? }
  end

  def splatters
    @splatters ||= factors.map { RULES[_1] }
  end

  def sound
    splatters.empty? ? number : splatters.join
  end
end
