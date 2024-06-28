import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  list.fold(data, Nil, insert)
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  to_list(to_tree(data))
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

fn to_list(input: Tree) {
  case input {
    Nil -> []
    Node(data, left, right) ->
      list.concat([to_list(left), [data], to_list(right)])
  }
}
