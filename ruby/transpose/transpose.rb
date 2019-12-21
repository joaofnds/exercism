class Transpose
  def self.transpose(input)
    lines = input.split("\n")
    longest_line_size = lines.map(&:size).max
    lines
      .map { |line| line.ljust(longest_line_size).chars }
      .transpose
      .map(&:join)
      .join("\n")
  end
end
