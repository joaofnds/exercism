# frozen_string_literal: true

require 'forwardable'

class Strand
  extend Forwardable

  NUCLEOTIDES = %w[A C T G].freeze

  class InvalidDNANucleotideError < ArgumentError
    def initialize(message = "must be one of #{NUCLEOTIDES}")
      super
    end
  end

  def_delegators :@strand, :each, :length, :zip

  private

  attr_reader :strand

  def initialize(strand)
    assert_strand strand

    @strand = strand
  end

  def assert_strand(strand)
    raise Strand::InvalidDNANucleotideError unless dna_strand?(strand)
  end

  def dna_strand?(strand)
    strand.all? { |nucleotide| NUCLEOTIDES.include? nucleotide }
  end
end
