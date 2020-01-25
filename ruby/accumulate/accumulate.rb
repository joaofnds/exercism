class Array
  # this should do the trick but it's kinda cheating ;)
  # alias accumulate map

  def accumulate
    [].tap do |acc|
      each { acc << yield(_1) }
    end
  end
end
