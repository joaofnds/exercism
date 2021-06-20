require 'date'

class Meetup
  WEEKDAYS = %i[sunday monday tuesday wednesday thursday friday saturday]

  WEEK_OFFSET = {
    first: 1,
    second: 8,
    third: 15,
    fourth: 22,
    teenth: 13,
    last: -7
  }

  def day(weekday, offset)
    first = Date.new(year, month, WEEK_OFFSET[offset])
    first + (WEEKDAYS.index(weekday) - first.wday) % 7
  end

  private

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end
end
