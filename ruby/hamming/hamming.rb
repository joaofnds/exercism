require_relative 'stranderrors'

class Hamming
  include StrandErrors

  def self.compute(strand1, strand2)
    new(strand1, strand2).distance
  end

  def distance
    nucleotides.count { |nucleotide1, nucleotide2| nucleotide1 != nucleotide2 }
  end

  private

  attr_reader :strand1, :strand2

  def initialize(strand1, strand2)
    raise StrandLengthsError unless strand1.length == strand2.length

    @strand1 = strand1
    @strand2 = strand2
  end

  def nucleotides
    @nucleotides ||= strand1.chars.zip(strand2.chars)
  end
end
