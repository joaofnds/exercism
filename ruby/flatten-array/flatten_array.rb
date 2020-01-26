class FlattenArray
  # we can achieve the desired result with `#flatten` and `#compact`
  # def self.flatten(array)
  #   array.flatten.compact
  # end

  def self.flatten(array)
    array.each_with_object([]) do |element, memo|
      case element
      when nil
        next
      when Array
        memo.concat flatten(element)
      else
        memo.push element
      end
    end
  end
end
