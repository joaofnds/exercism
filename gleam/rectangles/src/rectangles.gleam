import gleam/bool
import gleam/int
import gleam/list
import gleam/string

type Point {
  Point(char: String, x: Int, y: Int)
}

pub fn rectangles(input: String) -> Int {
  let points =
    input
    |> string.split("\n")
    |> list.index_map(fn(line, y) {
      line
      |> string.to_graphemes
      |> list.index_map(fn(char, x) { Point(char, x, y) })
    })
    |> list.flatten

  points
  |> list.filter(fn(p) { p.char == "+" })
  |> list.combinations(4)
  |> list.map(list.sort(_, fn(a, b) { int.compare(a.x, b.x) }))
  |> list.filter(fn(vertices) {
    let assert [tl, bl, tr, br] = vertices
    use <- bool.guard(
      tl.y != tr.y || tr.x != br.x || br.y != bl.y || bl.x != tl.x,
      False,
    )

    let horizontal =
      list.filter(points, fn(p) {
        { p.y == tl.y || p.y == bl.y } && tl.x < p.x && p.x < tr.x
      })
    let vertical =
      list.filter(points, fn(p) {
        { p.x == tl.x || p.x == tr.x } && tl.y < p.y && p.y < bl.y
      })

    list.all(horizontal, fn(p) { p.char == "-" || p.char == "+" })
    && list.all(vertical, fn(p) { p.char == "|" || p.char == "+" })
  })
  |> list.length
}
