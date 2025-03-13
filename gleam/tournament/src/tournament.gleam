import gleam/bool
import gleam/dict
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn tally(input: String) -> String {
  input
  |> string.split("\n")
  |> list.flat_map(parse_line)
  |> list.group(fn(p) { p.0 })
  |> dict.map_values(fn(_, v) { sum_stats(list.map(v, fn(p) { p.1 })) })
  |> dict.to_list
  |> list.sort(fn(a, b) {
    int.compare(
      result.unwrap(list.last(b.1), 0),
      result.unwrap(list.last(a.1), 0),
    )
  })
  |> list.map(fn(p) { stats_line(p.0, p.1) })
  |> list.prepend("Team                           | MP |  W |  D |  L |  P")
  |> string.join("\n")
}

fn parse_line(line: String) -> List(#(String, List(Int))) {
  use <- bool.guard(line == "", [])

  let assert [team1, team2, result] = string.split(line, ";")
  let assert [stats1, stats2] = result_stats(result)

  [#(team1, stats1), #(team2, stats2)]
}

fn result_stats(result: String) -> List(List(Int)) {
  case result {
    "win" -> [[1, 1, 0, 0, 3], [1, 0, 0, 1, 0]]
    "loss" -> [[1, 0, 0, 1, 0], [1, 1, 0, 0, 3]]
    "draw" -> [[1, 0, 1, 0, 1], [1, 0, 1, 0, 1]]
    _ -> panic as "invalid result"
  }
}

fn sum_stats(stats_list: List(List(Int))) -> List(Int) {
  list.fold(stats_list, [0, 0, 0, 0, 0], fn(acc, stats) {
    list.map2(acc, stats, int.add)
  })
}

fn stats_line(team: String, stats: List(Int)) -> String {
  let stats_line =
    stats
    |> list.map(int.to_string)
    |> list.map(string.pad_left(_, 2, " "))
    |> string.join(" | ")

  string.pad_right(team, 30, " ") <> " | " <> stats_line
}
