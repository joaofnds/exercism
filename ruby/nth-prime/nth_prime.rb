module Prime
  def self.nth(nth)
    raise ArgumentError if nth.zero?

    n = 1
    nth.times { n = next_prime(n) }
    n
  end

  def self.next_prime(number)
    n = number + 1
    n += 1 until prime?(n)
    n
  end

  def self.prime?(number)
    (2..Math.sqrt(number)).none? { (number % _1).zero? }
  end
end
