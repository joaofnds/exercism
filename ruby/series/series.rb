class Series
  def initialize(str)
    @str = str
  end

  def slices(n)
    raise ArgumentError if n > str.length

    (0..(str.length - n)).map { |i| str[i, n] }
  end

  private

  attr_reader :str
end
