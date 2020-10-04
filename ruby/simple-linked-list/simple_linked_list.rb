class Element
  attr_accessor :next
  attr_reader :datum

  private

  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def push(element)
    element.next = head
    @head = element

    self
  end

  def pop
    result = head
    @head = head&.next

    result
  end

  def reverse!
    previous_node = nil
    current_node = head

    until current_node.nil?
      next_node = current_node.next
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
    end

    @head = previous_node

    self
  end

  def to_a
    result = []

    current_node = head
    until current_node.nil?
      result << current_node.datum
      current_node = current_node.next
    end

    result
  end

  private

  attr_accessor :elements
  attr_accessor :head

  def initialize(elements_to_initialize = [])
    @head = nil
    elements_to_initialize.map { Element.new(_1) }.each { push _1 }
  end
end
