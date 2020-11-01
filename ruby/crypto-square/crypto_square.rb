class Crypto
  def ciphertext
    return '' if @columns.zero?

    chuncked_plaintext.transpose.map(&:join).join(' ')
  end

  private

  attr_reader :plaintext, :columns

  def initialize(plaintext)
    @plaintext = plaintext.downcase.gsub(/[^\w]/, '')
    @columns = Math.sqrt(@plaintext.length).ceil
  end

  def chuncked_plaintext
    chunks = plaintext.chars.each_slice(columns).to_a
    chunks.last << ' ' while chunks.last.length < columns
    chunks
  end
end
