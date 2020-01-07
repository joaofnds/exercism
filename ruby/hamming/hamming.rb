# frozen_string_literal: true

class DNA
  NUCLEOTIDES = %w[A C T G].freeze

  def self.dna_strand?(dna_strand)
    dna_strand.chars.all? { |nucleotide| NUCLEOTIDES.include? nucleotide }
  end
end

class Hamming
  class DifferentLengthSequencesError < ArgumentError; end

  def self.compute(sequence1, sequence2)
    unless DNA.dna_strand?(sequence1)
      raise ArgumentError, 'sequence1 is not a valid DNA strand'
    end

    unless DNA.dna_strand?(sequence2)
      raise ArgumentError, 'sequence2 is not a valid DNA strand'
    end

    new(sequence1, sequence2).distance
  end

  def distance
    assert_comparable

    pairs = sequence1.chars.zip(sequence2.chars)
    pairs.count { |a, b| a != b }
  end

  private

  attr_reader :sequence1, :sequence2

  def initialize(sequence1, sequence2)
    @sequence1 = sequence1
    @sequence2 = sequence2
  end

  def assert_same_length_sequences
    unless sequence1.length == sequence2.length
      raise DifferentLengthSequencesError, 'different length sequences'
    end

    true
  end

  alias assert_comparable assert_same_length_sequences
end
