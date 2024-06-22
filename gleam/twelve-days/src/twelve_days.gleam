import gleam/list
import gleam/string

const days = [
  "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth",
  "ninth", "tenth", "eleventh", "twelfth",
]

const gifts = [
  "a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens",
  "four Calling Birds", "five Gold Rings", "six Geese-a-Laying",
  "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing",
  "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming",
]

pub fn verse(number: Int) -> String {
  let assert Ok(day) = list.first(list.drop(days, number - 1))

  let g = case list.take(gifts, number) {
    [] -> "nothing 😭"
    [gift] -> gift
    [gift, ..rest] -> string.join(list.reverse(rest), ", ") <> ", and " <> gift
  }

  "On the " <> day <> " day of Christmas my true love gave to me: " <> g <> "."
}

pub fn lyrics(from starting_verse: Int, to ending_verse: Int) -> String {
  list.range(starting_verse, ending_verse)
  |> list.map(verse)
  |> string.join("\n")
}
