import gleam/list
import gleam/result
import gleam/string

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
}

const students = [
  Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid,
  Larry,
]

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  use line <- list.flat_map(string.split(diagram, "\n"))

  line
  |> string.to_graphemes
  |> list.map(letter_to_plant)
  |> list.sized_chunk(2)
  |> list.zip(students, _)
  |> list.key_find(student)
  |> result.unwrap([])
}

fn letter_to_plant(letter: String) -> Plant {
  case letter {
    "V" -> Violets
    "C" -> Clover
    "R" -> Radishes
    "G" -> Grass
    _ -> panic as "invalid plant letter"
  }
}
