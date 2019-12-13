class Series
  def initialize(str)
    @str = str
  end

  def slices(n)
    raise ArgumentError if n > str.length

    str.chars.each_cons(n).map(&:join)
  end

  private

  attr_reader :str
end
