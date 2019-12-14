class SpaceAge
  ORBITAL_PERIOD = { # in seconds
    earth: 31_557_600,
    mercury: 7_600_543,
    venus: 19_414_149,
    mars: 59_354_032,
    jupiter: 374_355_659,
    saturn: 929_292_362,
    uranus: 2_651_370_019,
    neptune: 5_200_418_560
  }.freeze

  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL_PERIOD.each_pair do |planet, orbital_seconds|
    define_method :"on_#{planet}" do
      seconds.fdiv(orbital_seconds)
    end
  end

  private

  attr_reader :seconds
end
