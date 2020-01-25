Array.class_eval do
  # this should do the trick but it's kinda cheating ;)
  # alias accumulate map

  def accumulate
    return to_enum unless block_given?

    each_with_object([]) { _2 << yield(_1) }
  end
end
