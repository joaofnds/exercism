class Sieve
  def primes
    generate_list
    mark_primes
    unmarked_numbers
  end

  private

  attr_reader :max, :numbers_marks

  def initialize(max)
    @max = max
  end

  def primes?(n1, n2)
    (n1 % n2).zero?
  end

  def mark(i)
    numbers_marks[i][1] = true
  end

  def generate_list
    @numbers_marks = (2..max).map { |n| [n, false] }
  end

  def mark_primes
    (0..max).each do |i|
      n1, marked = numbers_marks[i]
      next if marked

      ((i + 1)..(max - 2)).each do |j|
        n2, marked = numbers_marks[j]
        next if marked

        mark(j) if primes?(n2, n1)
      end
    end
  end

  def unmarked_numbers
    numbers_marks.reject(&:last).map(&:first)
  end
end
