class Pangram
  def self.pangram?(sentence)
    sentence.downcase.scan(/[a-z]/).uniq.count == 26
  end
end
