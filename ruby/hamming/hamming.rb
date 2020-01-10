class Hamming
  class StrandLengthsError < ArgumentError
    def initialize(message = 'strands must have equal lengths')
      super
    end
  end

  def self.compute(strand1, strand2)
    new(strand1, strand2).distance
  end

  def distance
    raise StrandLengthsError unless equal_lengths?

    strand1.chars.zip(strand2.chars).count { |n1, n2| n1 != n2 }
  end

  private

  attr_reader :strand1, :strand2

  def initialize(strand1, strand2)
    @strand1 = strand1
    @strand2 = strand2
  end

  def equal_lengths?
    strand1.length == strand2.length
  end
end
