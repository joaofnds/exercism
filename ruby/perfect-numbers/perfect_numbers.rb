class PerfectNumber
  def self.classify(number)
    new(number).classify
  end

  def classify
    if perfect?
      'perfect'
    elsif deficient?
      'deficient'
    elsif abundant?
      'abundant'
    end
  end

  private

  attr_reader :number, :aliquot_sum

  def initialize(number)
    raise if number.negative?

    @number = number
    @aliquot_sum = factors.sum
  end

  def factors
    (1..(number / 2)).filter { (number % _1).zero? }
  end

  def perfect?
    aliquot_sum == number
  end

  def abundant?
    aliquot_sum > number
  end

  def deficient?
    aliquot_sum < number
  end
end
