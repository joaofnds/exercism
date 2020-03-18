class TwoBucket
  attr_reader :goal_bucket, :other_bucket, :moves

  private

  attr_reader :bucket_one, :bucket_two, :goal

  def initialize(size_one, size_two, goal, goal_bucket_name)
    @bucket_one = Bucket.new('one', size_one)
    @bucket_two = Bucket.new('two', size_two)
    swap_buckets! if goal_bucket_name == 'two'
    @goal = goal
    @moves = count_moves!
    assign_bucket_attributes
  end

  def count_moves!
    moves = 0
    until some_bucket_reached_goal?
      move!
      moves += 1
    end
    moves
  end

  def move!
    if bucket_one.empty?
      bucket_one.fill
    elsif bucket_two.full?
      bucket_two.empty!
    elsif bucket_two.size == goal
      bucket_two.fill
    else
      bucket_one.pour(bucket_two)
    end
  end

  def swap_buckets!
    @bucket_one, @bucket_two = @bucket_two, @bucket_one
  end

  def some_bucket_reached_goal?
    bucket_one.load_is?(goal) || bucket_two.load_is?(goal)
  end

  def assign_bucket_attributes
    swap_buckets! if bucket_two.load_is?(goal)

    @goal_bucket = bucket_one.name
    @other_bucket = bucket_two.load
  end
end

class Bucket
  attr_reader :name, :size, :load

  def load_is?(liters)
    load == liters
  end

  def full?
    size == load
  end

  def empty?
    load.zero?
  end

  def fill(liters = @size)
    @load = [@load + liters, @size].min
  end

  def empty!
    @load = 0
  end

  def pour(other_bucket)
    liters = [other_bucket.size - other_bucket.load, @load].min
    other_bucket.fill(liters)
    @load -= liters
  end

  private

  def initialize(name, size, load = 0)
    @name = name
    @size = size
    @load = load
  end
end
