class WordProblem
  OPERATIONS = { 'plus' => :+, 'minus' => :-, 'multiplied by' => :*, 'divided by' => :/ }.freeze

  def answer
    numbers = problem.scan(/-?\d+/).map(&:to_i)
    operations = problem.scan(/[[[:alpha:]]\s]+/).map(&:strip).map { OPERATIONS[_1] }
    raise ArgumentError unless operations.any?

    numbers.reduce { |result, number| result.send(operations.shift, number) }
  end

  private

  attr_reader :problem

  def initialize(problem)
    @problem = problem.downcase.gsub('what is ', '').gsub('?', '')
  end
end
