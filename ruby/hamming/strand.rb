require 'forwardable'

class Strand
  extend Forwardable

  def -(other)
    strand.zip(other).count { |n1, n2| n1 != n2 }
  end

  private

  attr_reader :strand

  def_delegators :strand, :length, :each

  def initialize(strand)
    @strand = strand.chars
  end
end
