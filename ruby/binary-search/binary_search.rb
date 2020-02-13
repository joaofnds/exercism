class BinarySearch
  def search_for(target)
    low = 0
    high = list.length
    mid = low + (high - low) / 2

    while low < high
      case target <=> list[mid]
      when -1
        high = mid
        mid = low + (high - low) / 2
      when 0
        return mid
      when 1
        low = mid + 1
        mid = low + (high - low) / 2
      end
    end
  end

  private

  attr_accessor :list

  def initialize(list)
    @list = list
  end
end
