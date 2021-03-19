def delete_first(arr, elem)
  arr = arr.dup
  arr.delete_at(arr.index(elem) || arr.length)
  arr
end

class Dominoes
  class << self
    def chain?(stones)
      stones.empty? || stones.any? { backtrack delete_first(stones, _1), [_1] }
    end

    def backtrack(stones, chain)
      if stones.empty?
        chain.first.first == chain.last.last
      else
        stones.any? do |stone|
          m = match(chain.last, stone)
          m && backtrack(delete_first(stones, stone), chain + [m])
        end
      end
    end

    def match(d1, d2)
      _, b = d1
      c, d = d2
      case b
      when c
        [c, d]
      when d
        [d, c]
      end
    end
  end
end
