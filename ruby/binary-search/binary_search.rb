class BinarySearch
  def search_for(target)
    # list.bsearch_index { target <=> _1 }

    low = 0
    high = list.length

    while low < high
      mid = low + (high - low) / 2
      case target <=> list[mid]
      when -1
        high = mid
      when 0
        return mid
      when 1
        low = mid + 1
      end
    end
  end

  private

  attr_accessor :list

  def initialize(list)
    @list = list
  end
end
