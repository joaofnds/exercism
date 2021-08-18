class PrimeFactors
  def self.of(n)
    result = []

    i = 2.0
    while n >= i
      if (n % i).zero?
        n /= i
        result << i
      else
        i += 1
      end
    end

    result
  end
end
