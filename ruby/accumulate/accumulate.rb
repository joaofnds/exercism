class Array
  # this should do the trick but it's kinda cheating ;)
  # alias accumulate map

  def accumulate
    each_with_object([]) { _2 << yield(_1) }
  end
end
