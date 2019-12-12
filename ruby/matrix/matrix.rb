class Matrix
  attr_reader :rows, :columns
  def initialize(str)
    @rows = str.each_line.map { |line| line.split.map(&:to_i) }
    @columns = @rows.transpose
  end
end
