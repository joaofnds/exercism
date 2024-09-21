import gleam/bool
import gleam/list
import gleam/set

pub type Tree(a) {
  Nil
  Node(value: a, left: Tree(a), right: Tree(a))
}

pub type Error {
  DifferentLengths
  DifferentItems
  NonUniqueItems
}

pub fn tree_from_traversals(
  inorder inorder: List(a),
  preorder preorder: List(a),
) -> Result(Tree(a), Error) {
  use <- bool.guard(
    list.length(inorder) != list.length(preorder),
    Error(DifferentLengths),
  )

  use <- bool.guard(
    set.size(set.from_list(inorder)) != list.length(inorder),
    Error(NonUniqueItems),
  )

  use <- bool.guard(
    set.from_list(inorder) != set.from_list(preorder),
    Error(DifferentItems),
  )

  Ok(traverse(inorder, preorder))
}

fn traverse(inorder: List(a), preorder: List(a)) -> Tree(a) {
  use <- bool.guard(list.is_empty(inorder), Nil)

  let assert Ok(root) = list.find(preorder, list.contains(inorder, _))
  let assert #(left, [_, ..right]) =
    list.split_while(inorder, fn(ch) { ch != root })

  Node(root, traverse(left, preorder), traverse(right, preorder))
}
