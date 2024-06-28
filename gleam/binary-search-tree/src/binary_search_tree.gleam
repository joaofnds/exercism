import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  list.fold(data, Nil, insert)
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  sorting_tree(to_tree(data))
}

fn insert(tree: Tree, num: Int) {
  case tree {
    Nil -> Node(num, Nil, Nil)
    Node(data, left, right) ->
      case num <= data {
        True -> Node(data, insert(left, num), right)
        False -> Node(data, left, insert(right, num))
      }
  }
}

fn sorting_tree(input: Tree) {
  case input {
    Nil -> []
    Node(data, left, right) ->
      list.concat([sorting_tree(left), [data], sorting_tree(right)])
  }
}
