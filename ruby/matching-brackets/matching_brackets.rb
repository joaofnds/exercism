# frozen_string_literal: true

class Brackets
  class UnmatchedBracketError < StandardError; end

  OPEN_CLOSE = {
    '[': ']',
    '(': ')',
    '{': '}'
  }.transform_keys!(&:to_s).freeze

  def self.paired?(expression)
    new(expression).paired?
  end

  def paired?
    scan
    stack.empty?
  rescue UnmatchedBracketError
    false
  end

  private

  attr_reader :expression, :stack

  def initialize(expression)
    @expression = expression
    @stack = []
  end

  def scan
    expression.each_char do |char|
      if opening? char
        open! char
      elsif closing? char
        close! char
      end
    end
  end

  def open!(char)
    stack.push char
  end

  def close!(char)
    raise UnmatchedBracketError unless stack.pop == matching_pair(char)
  end

  def matching_pair(char)
    OPEN_CLOSE[char] || OPEN_CLOSE.key(char)
  end

  def opening?(char)
    OPEN_CLOSE.key? char
  end

  def closing?(char)
    OPEN_CLOSE.value? char
  end
end
