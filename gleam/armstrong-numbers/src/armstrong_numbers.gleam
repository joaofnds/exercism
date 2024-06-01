import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = int.digits(number, 10)
  let length = list.length(digits)
  let armstrong_sum =
    list.fold(digits, 0, fn(total, digit) {
      total + int.product(list.repeat(digit, length))
    })
  armstrong_sum == number
}
