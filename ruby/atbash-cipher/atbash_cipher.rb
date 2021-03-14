ALPHABET = "abcdefghijklmnopqrstuvwxyz".chars
PAIRS = ALPHABET.zip(ALPHABET.reverse)

class Atbash
  def self.encode(string)
    string
      .downcase
      .gsub(/[^a-z0-9]/, "")
      .chars.map { |c| PAIRS.find { _1[0] == c }&.at(1) || c }
      .each_slice(5)
      .map(&:join)
      .join(" ")
  end

  def self.decode(string)
    string
      .delete(" ")
      .chars.map { |c| PAIRS.find { _1[1] == c }&.at(0) || c }
      .join
  end
end
