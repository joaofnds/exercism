class ArmstrongNumbers
  def self.include?(number)
    armstrong_sum(number) == number
  end

  def self.armstrong_sum(number)
    digits = number.digits
    digits.sum { |digit| digit**digits.count }
  end
end
