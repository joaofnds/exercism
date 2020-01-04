class Nucleotide
  NUCLEOTIDES = %w[A C T G]

  def self.valid_dna_strand?(dna_strand)
    dna_strand =~ /^[#{NUCLEOTIDES}]*$/
  end

  def self.from_dna(dna_strand)
    raise ArgumentError unless valid_dna_strand? dna_strand

    new(dna_strand)
  end

  private

  def initialize(dna_strand)
    @histogram = NUCLEOTIDES.map { |n| [n, dna_strand.count(n)] }.to_h
  end

  public

  attr_reader :histogram

  def count(nucleotide)
    histogram[nucleotide]
  end
end
