# frozen_string_literal: true

class Brackets
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
      else
        next
      end
    end
  end

  def open!(char)
    stack.push char
  end

  def close!(char)
    if stack.last == matching_pair(char)
      stack.pop
    else
      stack.push('E')
    end
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
