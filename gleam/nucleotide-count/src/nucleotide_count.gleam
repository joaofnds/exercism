import gleam/dict.{type Dict}
import gleam/list
import gleam/result
import gleam/string

pub fn nucleotide_count(dna: String) -> Result(Dict(String, Int), Nil) {
  let acc = dict.from_list([#("A", 0), #("C", 0), #("T", 0), #("G", 0)])
  use acc, nucleotide <- list.try_fold(string.to_graphemes(dna), acc)
  use count <- result.map(dict.get(acc, nucleotide))
  dict.insert(acc, nucleotide, count + 1)
}
