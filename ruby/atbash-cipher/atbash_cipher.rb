class Atbash
  REVERSE_ALPHABET = ('a'..'z').to_a.reverse.join
  def self.encode(str)
    str.downcase
       .tr('^a-z0-9', '')
       .tr('a-z', REVERSE_ALPHABET)
       .scan(/.{1,5}/)
       .join(' ')
  end

  def self.decode(str)
    str.delete(' ').tr('a-z', REVERSE_ALPHABET)
  end
end
