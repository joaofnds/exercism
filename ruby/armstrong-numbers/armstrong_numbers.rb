class ArmstrongNumbers
  def self.include?(number)
    armstrong_sum(number) == number
  end

  def self.armstrong_sum(number)
    digits = number.digits
    power = digits.length
    digits.sum { |digit| digit**power }
  end
end
