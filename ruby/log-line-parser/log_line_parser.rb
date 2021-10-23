class LogLineParser
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def message
    line.split(':')[1].strip
  end

  def log_level
    left = line.index('[') + 1
    right = line.index(']') - 1
    line[left..right].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
