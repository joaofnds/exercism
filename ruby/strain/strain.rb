module Strain
  def keep
    each_with_object([]) { _2 << _1 if yield(_1) }
  end

  def discard
    each_with_object([]) { _2 << _1 unless yield(_1) }
  end
end

class Array
  include Strain
end
