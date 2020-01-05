# frozen_string_literal: true

class Hamming
  DNA_NUCLEOTIDES = %w[A C T G].freeze

  def self.compute(strand_a, strand_b)
    assert_comparable_strands(strand_a, strand_b)

    pairs = strand_a.chars.zip(strand_b.chars)
    pairs.count { |a, b| a != b }
  end

  def self.assert_comparable_strands(*strands)
    unless strands.map(&:length).uniq.length == 1
      raise DifferentLengthStrandsError
    end

    strands.each do |strand|
      raise InvalidDNANucleotideError unless dna_strand?(strand)
    end

    true
  end

  def self.dna_strand?(strand)
    strand =~ /^[#{DNA_NUCLEOTIDES}]*$/
  end
end

class DifferentLengthStrandsError < ArgumentError
  def message
    'cannot compare different length strands'
  end
end

class InvalidDNANucleotideError < ArgumentError
  def message
    'DNA nucleotides must be on of A, C, T or G'
  end
end
