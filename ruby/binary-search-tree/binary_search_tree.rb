class Bst
  attr_accessor :data, :left, :right

  def each
    if block_given?
      left&.each { yield _1 }
      yield data
      right&.each { yield _1 }
    else
      Enumerator.new do |y|
        each { y << _1 }
      end
    end
  end

  def insert(new_data)
    if new_data <= data
      insert_left(new_data)
    else
      insert_right(new_data)
    end
  end

  def insert_left(new_data)
    if left
      left.insert(new_data)
    else
      self.left = Bst.new(new_data)
    end
  end

  def insert_right(new_data)
    if right
      right.insert(new_data)
    else
      self.right = Bst.new(new_data)
    end
  end

  private

  def initialize(data)
    @data = data
  end
end
