pub type Planet {
  Mercury
  Venus
  Earth
  Mars
  Jupiter
  Saturn
  Uranus
  Neptune
}

pub fn age(planet: Planet, seconds: Float) -> Float {
  to_earth_years(seconds) /. to_orbital_period(planet)
}

fn to_earth_years(seconds: Float) -> Float {
  let earth_year_in_seconds = 365.25 *. 24.0 *. 60.0 *. 60.0
  seconds /. earth_year_in_seconds
}

fn to_orbital_period(planet: Planet) -> Float {
  case planet {
    Mercury -> 0.2408467
    Venus -> 0.61519726
    Earth -> 1.0
    Mars -> 1.8808158
    Jupiter -> 11.862615
    Saturn -> 29.447498
    Uranus -> 84.016846
    Neptune -> 164.79132
  }
}
