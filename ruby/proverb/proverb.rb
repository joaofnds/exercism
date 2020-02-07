class Proverb
  def to_s
    proverb = ''

    pairs.each do |thing1, thing2|
      proverb += "For want of a #{thing1} the #{thing2} was lost.\n"
    end

    proverb += last_line
  end

  private

  attr_reader :things, :pairs, :qualifier

  def initialize(*things, qualifier: nil)
    @things = things
    @qualifier = qualifier
    @pairs = [].tap { |arr| things.each_cons(2) { arr.push _1 } }
  end

  def qualified_name
    if qualifier.nil?
      things.first
    else
      qualifier + ' ' + things.first
    end
  end

  def last_line
    "And all for the want of a #{qualified_name}."
  end
end
