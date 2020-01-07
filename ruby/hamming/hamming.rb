# frozen_string_literal: true

class DNA
  NUCLEOTIDES = %w[A C T G].freeze

  private_constant :NUCLEOTIDES

  def initialize(strand)
    @strand = strand
  end

  def valid_strand?
    strand =~ /^[#{NUCLEOTIDES}]*$/
  end

  private

  attr_reader :strand
end

class Hamming
  class DifferentLengthStrandsError < ArgumentError; end
  class InvalidDNANucleotideError < ArgumentError; end

  def self.compute(strand_a, strand_b)
    new(strand_a, strand_b).distance
  end

  def initialize(strand_a, strand_b)
    @strand_a = strand_a
    @strand_b = strand_b
  end

  def distance
    assert_comparable_strands

    pairs = strand_a.chars.zip(strand_b.chars)
    pairs.count { |a, b| a != b }
  end

  private

  attr_reader :strand_a, :strand_b

  def assert_comparable_strands
    unless strand_a.length == strand_b.length
      raise DifferentLengthStrandsError, 'different length strands'
    end

    unless DNA.new(strand_a).valid_strand?
      raise InvalidDNANucleotideError, 'strand A is not a valid DNA strand'
    end

    unless DNA.new(strand_b).valid_strand?
      raise InvalidDNANucleotideError, 'strand B is not a valid DNA strand'
    end

    true
  end
end
