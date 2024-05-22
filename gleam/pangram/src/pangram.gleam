import gleam/function.{curry2}
import gleam/list.{all}
import gleam/string.{contains, lowercase}

const alphabet = [
  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
  "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
]

pub fn is_pangram(sentence: String) -> Bool {
  all(alphabet, curry2(contains)(lowercase(sentence)))
}
