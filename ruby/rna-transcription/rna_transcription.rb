class Complement
  def self.of_dna(dna)
    dna.split('').map { |nucleotide| rna_complement(nucleotide) }.join('')
  end

  def self.rna_complement(dna_nucleotide)
    case dna_nucleotide
    when "C"
      "G"
    when "G"
      "C"
    when "T"
      "A"
    when "A"
      "U"
    else
      ""
    end
  end
end
