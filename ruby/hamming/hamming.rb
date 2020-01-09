class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length
    raise ArgumentError if (strand1 + strand2) =~ /^[ACTG]$/

    strand1.chars.zip(strand2.chars).count { |n1, n2| n1 != n2 }
  end
end
