class InvalidCodonError < StandardError; end

class Translation
  CODON_PROTEIN_HASH = {
    AUG: 'Methionine',
    UUU: 'Phenylalanine',
    UUC: 'Phenylalanine',
    UUA: 'Leucine',
    UUG: 'Leucine',
    UCU: 'Serine',
    UCC: 'Serine',
    UCA: 'Serine',
    UCG: 'Serine',
    UAU: 'Tyrosine',
    UAC: 'Tyrosine',
    UGU: 'Cysteine',
    UGC: 'Cysteine',
    UGG: 'Tryptophan',
    UAA: 'STOP',
    UAG: 'STOP',
    UGA: 'STOP'
  }.freeze

  def self.of_codon(codon)
    CODON_PROTEIN_HASH.fetch(codon.to_sym) do
      raise InvalidCodonError
    end
  end

  def self.of_rna(rna)
    codons_from_rna(rna)
      .map { of_codon(_1) }
      .slice_before('STOP')
      .first
  end

  def self.codons_from_rna(rna)
    rna.chars.each_slice(3).map(&:join)
  end
end
