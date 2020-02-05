class Matrix
  attr_reader :columns, :rows

  def saddle_points
    [].tap do |points|
      rows.each_with_index do |row, i|
        row.each_with_index do |_, j|
          points << [i, j] if point?(i, j)
        end
      end
    end
  end

  private

  def initialize(number_list_as_string)
    @rows = parse_matrix(number_list_as_string)
    @columns = rows.transpose
  end

  def parse_matrix(raw_input)
    raw_input.lines.map { _1.strip.split(' ').map(&:to_i) }
  end

  def point?(row_index, column_index)
    number = rows[row_index][column_index]
    number == rows[row_index].max && number == columns[column_index].min
  end

  def to_s
    rows.reduce('') do |out, row|
      row.each { out += format('%<number>4d', number: _1) }
      out += "\n"
    end
  end
end
