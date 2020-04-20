class BaseConverter
  def self.convert(in_base, digits, out_base)
    raise ArgumentError unless valid_digits?(digits, in_base, out_base)

    base10 = to_base_10(digits, in_base)
    from_base_10(base10, out_base)
  end

  def self.valid_digits?(digits, in_base, out_base)
    in_base > 1 && out_base > 1 && digits.all? { |n| (0...in_base).cover?(n) }
  end

  def self.to_base_10(digits, base)
    digits.reverse.each_with_index.reduce(0) do |sum, number_and_index|
      number, index = number_and_index
      sum + (number * base**index)
    end
  end

  def self.from_base_10(number, base)
    n = number
    digits = []

    while n.positive?
      digits << n.remainder(base)
      n = (n / base).floor
    end

    digits.empty? ? [0] : digits.reverse
  end
end
