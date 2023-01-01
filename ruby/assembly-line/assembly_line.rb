class AssemblyLine
  CARS_PER_HOUR = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    CARS_PER_HOUR * @speed * success_rate
  end

  def working_items_per_minute
    production_rate_per_hour.to_i / 60
  end

  private

  def success_rate
    case @speed
    when 1..4
      1
    when 5..8
      0.9
    when 9
      0.8
    else
      0.77
    end
  end
end
