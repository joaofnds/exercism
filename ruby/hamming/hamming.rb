require_relative 'strand'

class Hamming
  class SequenceLengthError < ArgumentError; end

  def self.compute(sequence1, sequence2)
    strand1 = Strand.new(sequence1.chars)
    strand2 = Strand.new(sequence2.chars)

    new(strand1, strand2).distance
  end

  def distance
    sequence1.zip(sequence2).count { |m1, m2| m1 != m2 }
  end

  private

  attr_reader :sequence1, :sequence2

  def initialize(sequence1, sequence2)
    unless sequence1.length == sequence2.length
      raise SequenceLengthError, 'sequences must have the same length'
    end

    @sequence1 = sequence1
    @sequence2 = sequence2
  end
end
