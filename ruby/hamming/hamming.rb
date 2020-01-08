# frozen_string_literal: true

require_relative 'hammingerrors'
require_relative 'strand'

class Hamming
  include HammingErrors

  def self.compute(strand_str1, strand_str2)
    strand1 = Strand.new(strand_str1.chars)
    strand2 = Strand.new(strand_str2.chars)

    new(strand1, strand2).distance
  end

  def distance
    assert_same_length

    sequence1.zip(sequence2).count { |a, b| a != b }
  end

  private

  attr_reader :sequence1, :sequence2

  def initialize(sequence1, sequence2)
    @sequence1 = sequence1
    @sequence2 = sequence2
  end

  def assert_same_length
    return true if sequence1.length == sequence2.length

    raise DifferentLengthSequencesError
  end
end
