class Crypto
  def ciphertext
    return '' if @columns.zero?

    chunked_plaintext.transpose.map(&:join).join(' ')
  end

  private

  attr_reader :plaintext, :columns

  def initialize(plaintext)
    @plaintext = plaintext.downcase.gsub(/\W/, '')
    @columns = Math.sqrt(@plaintext.length).ceil
  end

  def chunked_plaintext
    chunks = plaintext.chars.each_slice(columns).to_a
    chunks.last << ' ' while chunks.last.length < columns
    chunks
  end
end
