class FlattenArray
  def self.flatten(array)
    array.each_with_object([]) do |element, array|
      case element
      when nil
        next
      when Array
        array.concat flatten(element)
      else
        array.push element
      end
    end
  end
end
