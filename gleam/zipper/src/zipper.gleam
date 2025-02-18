pub type Tree(a) {
  Leaf
  Node(value: a, left: Tree(a), right: Tree(a))
}

pub type Branch(a) {
  Left(Tree(a))
  Right(Tree(a))
}

pub opaque type Zipper(a) {
  Zipper(focus: Tree(a), children: List(Branch(a)))
}

pub fn to_zipper(tree: Tree(a)) -> Zipper(a) {
  Zipper(tree, [])
}

pub fn to_tree(zipper: Zipper(a)) -> Tree(a) {
  case up(zipper) {
    Ok(parent) -> to_tree(parent)
    Error(Nil) -> zipper.focus
  }
}

pub fn value(zipper: Zipper(a)) -> Result(a, Nil) {
  case zipper.focus {
    Node(focus, _, _) -> Ok(focus)
    Leaf -> Error(Nil)
  }
}

pub fn up(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper {
    Zipper(focus, [Right(Node(value, left, _)), ..children]) ->
      Ok(Zipper(Node(value, left, focus), children))

    Zipper(focus, [Left(Node(value, _, right)), ..children]) ->
      Ok(Zipper(Node(value, focus, right), children))

    _ -> Error(Nil)
  }
}

pub fn left(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper.focus {
    Node(_, left, _) ->
      Ok(Zipper(left, [Left(zipper.focus), ..zipper.children]))
    Leaf -> Error(Nil)
  }
}

pub fn right(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper.focus {
    Node(_, _, right) ->
      Ok(Zipper(right, [Right(zipper.focus), ..zipper.children]))
    Leaf -> Error(Nil)
  }
}

pub fn set_value(zipper: Zipper(a), value: a) -> Zipper(a) {
  case zipper.focus {
    Node(_, left, right) -> Zipper(Node(value, left, right), zipper.children)
    Leaf -> zipper
  }
}

pub fn set_left(zipper: Zipper(a), tree: Tree(a)) -> Result(Zipper(a), Nil) {
  case zipper.focus {
    Node(focus, _, right) ->
      Ok(Zipper(Node(focus, tree, right), zipper.children))
    Leaf -> Error(Nil)
  }
}

pub fn set_right(zipper: Zipper(a), tree: Tree(a)) -> Result(Zipper(a), Nil) {
  case zipper.focus {
    Node(focus, left, _) -> Ok(Zipper(Node(focus, left, tree), zipper.children))
    Leaf -> Error(Nil)
  }
}
