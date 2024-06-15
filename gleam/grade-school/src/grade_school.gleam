import gleam/bool
import gleam/dict
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub type School =
  dict.Dict(Int, List(String))

pub fn create() -> School {
  dict.new()
}

pub fn add(
  to school: School,
  student student: String,
  grade desired_grade: Int,
) -> Result(School, Nil) {
  use <- bool.guard(list.contains(roster(school), student), Error(Nil))

  Ok(dict.insert(
    school,
    desired_grade,
    list.sort([student, ..grade(school, desired_grade)], string.compare),
  ))
}

pub fn roster(school: School) -> List(String) {
  dict.keys(school)
  |> list.sort(int.compare)
  |> list.flat_map(grade(school, _))
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  dict.get(school, desired_grade)
  |> result.unwrap([])
}
