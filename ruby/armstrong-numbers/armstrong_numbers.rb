class ArmstrongNumbers
  def self.include?(number)
    armstrong_sum(number) == number
  end

  def self.armstrong_sum(number)
    power = number.digits.length
    number.digits.reduce(0) { |sum, n| sum + n**power }
  end
end
