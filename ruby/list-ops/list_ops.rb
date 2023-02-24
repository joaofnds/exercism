module ListOps
  module_function

  def arrays(arr)
    fold(0, arr) { _1 + 1 }
  end

  def reverser(arr)
    fold([], arr) { |memo, v| memo.unshift(v) }
  end

  def concatter(a, b)
    fold(a, b, &:<<)
  end

  def mapper(arr, &block)
    fold([], arr) { |memo, v| memo << block[v] }
  end

  def filterer(arr, &block)
    fold([], arr) { |memo, v| block[v] ? memo << v : memo }
  end

  def sum_reducer(arr)
    fold(0, arr, &:+)
  end

  def factorial_reducer(arr)
    fold(1, arr, &:*)
  end

  def fold(memo, arr)
    arr.each { memo = yield memo, _1 }
    memo
  end
end
