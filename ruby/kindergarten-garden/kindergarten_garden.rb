class Garden
  def method_missing(name, *args, &block)
    index = students.index(name.to_s)
    super if index.nil?

    define_singleton_method(name) do
      flowers[index]
    end

    send(name)
  end

  def respond_to_missing?(method_name, include_private = false)
    !students.index(name.to_s).nil? || super
  end

  private

  attr_reader :flowers, :students

  def initialize(diagram, students = %w[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry])
    @flowers = parse_diagram(diagram)
    @students = students.map(&:downcase).sort
  end

  def parse_diagram(diagram)
    flowers = parse_flowers(diagram)
    line1, line2 = flowers
    line1.each_slice(2).zip(line2.each_slice(2)).map { _1 + _2 }
  end

  def parse_flowers(diagram)
    diagram.split.map do |line|
      line.chars.map do |char|
        flower(char)
      end
    end
  end

  def flower(char)
    {
      'R' => :radishes,
      'C' => :clover,
      'G' => :grass,
      'V' => :violets
    }[char]
  end
end
