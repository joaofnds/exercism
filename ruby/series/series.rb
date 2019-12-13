class Series
  def initialize(string)
    @string = string
  end

  def slices(length)
    raise ArgumentError if length > string.length

    string.chars.each_cons(length).map(&:join)
  end

  private

  attr_reader :string
end
