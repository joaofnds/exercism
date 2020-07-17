# frozen_string_literal: true

class RailFenceCipher
  TEMPLATE_EMPTY_CHAR = '.'
  TEMPLATE_FILL_CHAR = '?'

  def self.encode(a_message, this_amount_of_rails)
    RailFenceCipherEncoder.new(a_message, this_amount_of_rails).encode
  end

  def self.decode(a_message, this_amount_of_rails)
    RailFenceCipherDecoder.new(a_message, this_amount_of_rails).decode
  end

  private

  def initialize(message, amount_of_rails)
    @message = message
    @message_chars = extract_chars(message)
    @message_length = @message_chars.length
    @amount_of_rails = amount_of_rails
  end

  attr_reader :message, :message_chars, :message_length, :amount_of_rails

  def extract_chars(a_string)
    a_string.gsub(/\W/, '').chars
  end

  # alternating_sequence of length 10 and max 3 -> 0,1,2,3,2,1,0,1,2
  def alternating_sequence
    max = amount_of_rails - 1
    direction = 1
    current = 0

    result = [current]

    (message_length - 1).times do
      current += direction
      direction *= -1 if current.zero? || current == max
      result << current
    end

    result
  end

  def generate_template(alphabet: template_default_alphabet)
    rails = amount_of_rails.times.collect { message_length.times.collect { TEMPLATE_EMPTY_CHAR } }
    insertion_sequence = alternating_sequence

    message_length.times do |column|
      rails[insertion_sequence.shift][column] = alphabet.next
    end

    rails
  end

  def template_default_alphabet
    (1..Float::INFINITY).lazy.map { TEMPLATE_FILL_CHAR }
  end

  def valid_number_of_rails?
    amount_of_rails > 1 && message_length > amount_of_rails
  end

  def join_template(template)
    template.map(&:join).join
  end

  def remove_empty_char(a_string)
    a_string.gsub(TEMPLATE_EMPTY_CHAR, '')
  end
end

class RailFenceCipherEncoder < RailFenceCipher
  def encode
    return message unless valid_number_of_rails?

    rails = generate_template(alphabet: message_chars.each)
    remove_empty_char(join_template(rails))
  end
end

class RailFenceCipherDecoder < RailFenceCipher
  def decode
    return message unless valid_number_of_rails?

    template = generate_template
    chars =  message_chars

    rails = template.map do |row|
      row.map do |column|
        column == TEMPLATE_FILL_CHAR && chars.shift || column
      end
    end

    remove_empty_char(join_template(rails.transpose))
  end
end
