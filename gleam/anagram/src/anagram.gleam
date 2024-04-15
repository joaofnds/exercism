import gleam/string
import gleam/list

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, is_anagram(word, _))
}

fn is_anagram(a: String, b: String) -> Bool {
  let a = string.lowercase(a)
  let b = string.lowercase(b)
  a != b && sorted_graphemes(a) == sorted_graphemes(b)
}

fn sorted_graphemes(str: String) {
  str
  |> string.to_graphemes
  |> list.sort(string.compare)
}
