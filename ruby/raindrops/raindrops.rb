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

  attr_reader :number, :rules

  def initialize(number, rules=RULES)
    @number = number
    @rules = rules
  end

  def factors
    rules.keys.filter { |factor| (number % factor).zero? }
  end

  def splatter
    @splatters ||= factors.map { rules[_1] }.join
  end

  def sound
    splatter.empty? ? number : splatter
  end
end
