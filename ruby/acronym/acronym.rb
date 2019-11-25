class Acronym
  def self.abbreviate(phrase)
    phrase.upcase.scan(/(?:^|\W)([A-Z])/).join('')
  end
end
