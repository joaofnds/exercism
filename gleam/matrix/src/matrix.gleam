import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn row(index: Int, data: String) -> Result(List(Int), Nil) {
  data
  |> string.split("\n")
  |> list.map(string.split(_, " "))
  |> list.at(index - 1)
  |> result.try(list.try_map(_, int.parse))
}

pub fn column(index: Int, data: String) -> Result(List(Int), Nil) {
  data
  |> string.split("\n")
  |> list.map(string.split(_, " "))
  |> list.try_map(list.at(_, index - 1))
  |> result.try(list.try_map(_, int.parse))
}
