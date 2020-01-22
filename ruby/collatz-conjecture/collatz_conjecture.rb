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
    step until ended?

    steps_taken
  end

  private

  attr_accessor :current, :steps_taken

  def initialize(start)
    raise NotACollatzNumber unless start.positive?

    @current = start
    @steps_taken = 0
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
    self.steps_taken += 1
  end

  def ended?
    current <= 1
  end
end
