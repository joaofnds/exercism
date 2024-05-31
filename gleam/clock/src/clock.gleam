import gleam/int
import gleam/string

pub type Clock {
  Clock(minutes: Int)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  Clock(minutes: { { { hour * 60 + minute } % 1440 } + 1440 } % 1440)
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  create(hour: 0, minute: clock.minutes + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  create(hour: 0, minute: clock.minutes - minutes)
}

pub fn display(clock: Clock) -> String {
  string.pad_left(int.to_string(clock.minutes / 60), 2, "0")
  <> ":"
  <> string.pad_left(int.to_string(clock.minutes % 60), 2, "0")
}
