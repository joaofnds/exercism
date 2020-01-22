module CollatzErrors
  class NotACollatzNumber < ArgumentError
    def initialize(message = 'collatz numbers must be positive')
      super
    end
  end
end

class CollatzConjecture
  include CollatzErrors

  def self.steps(number)
    new(number).steps
  end

  def steps
    steps = 0

    until ended?
      step
      steps += 1
    end

    steps
  end

  private

  attr_accessor :current

  def initialize(start)
    raise NotACollatzNumber unless start.positive?

    @current = start
  end

  def next_step
    if current.even?
      current / 2
    else
      current * 3 + 1
    end
  end

  def step
    self.current = next_step
  end

  def ended?
    current <= 1
  end
end
