class Crypto
  def ciphertext
    return '' if @columns.zero?

    chuncked_plaintext
      .transpose
      .map(&:join)
      .join(' ')
  end

  private

  attr_reader :plaintext, :columns

  def initialize(plaintext)
    @plaintext = plaintext.downcase.gsub(/[^\w]/, '')
    @columns = Math.sqrt(@plaintext.length).ceil
  end

  def chuncked_plaintext
    plaintext.chars
      .each_slice(@columns)
      .map { pad_array(_1, @columns) }
  end

  def pad_array(array, size)
    array.fill(' ', array.length...size)
  end
end
