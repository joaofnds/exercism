import gleam/string

pub type Error {
  OutOfRange
}

pub fn say(number: Int) -> Result(String, Error) {
  case number {
    n if n < 0 || 1_000_000_000_000 <= n -> Error(OutOfRange)
    0 -> Ok("zero")
    n -> Ok(string.trim(do_say(n)))
  }
}

fn do_say(number: Int) -> String {
  case number {
    0 -> ""
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"
    10 -> "ten"
    11 -> "eleven"
    12 -> "twelve"
    13 -> "thirteen"
    14 -> "fourteen"
    15 -> "fifteen"
    16 -> "sixteen"
    17 -> "seventeen"
    18 -> "eighteen"
    19 -> "nineteen"
    20 -> "twenty"
    30 -> "thirty"
    40 -> "forty"
    50 -> "fifty"
    60 -> "sixty"
    70 -> "seventy"
    80 -> "eighty"
    90 -> "ninety"
    n if n < 100 -> {
      let rem = n % 10
      do_say(n - rem) <> "-" <> do_say(rem)
    }
    n if n < 1000 -> do_say(n / 100) <> " hundred " <> do_say(n % 100)
    n if n < 1_000_000 -> do_say(n / 1000) <> " thousand " <> do_say(n % 1000)
    n if n < 1_000_000_000 ->
      do_say(n / 1_000_000) <> " million " <> do_say(n % 1_000_000)
    n -> do_say(n / 1_000_000_000) <> " billion " <> do_say(n % 1_000_000_000)
  }
}
