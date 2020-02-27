class RunLengthEncoding
  def self.encode(input)
    new(input).encode
  end

  def self.decode(input)
    new(input).decode
  end

  def decode
    out = ''
    count = ''

    input.each_char do |char|
      if numeric? char
        count += char
      else
        out += expand_letter_count(char, count.to_i)
        count = ''
      end
    end

    out
  end

  def encode
    out = ''
    last_char = nil
    last_char_count = 0

    input.each_char do |char|
      if char == last_char
        last_char_count += 1
      else
        out += encode_letter_count(last_char, last_char_count) if last_char
        last_char = char
        last_char_count = 1
      end
    end

    out += encode_letter_count(last_char, last_char_count) if last_char

    out
  end

  private

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def encode_letter_count(letter, count)
    if count > 1
      "#{count}#{letter}"
    else
      letter
    end
  end

  def expand_letter_count(letter, count)
    if count.positive?
      letter * count
    else
      letter
    end
  end

  def numeric?(candidate)
    candidate =~ /[[:digit:]]/
  end
end
