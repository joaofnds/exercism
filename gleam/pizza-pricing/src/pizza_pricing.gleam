pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn order_price(order: List(Pizza)) -> Int {
  subtotal(order) + fee(order)
}

fn subtotal(order: List(Pizza)) -> Int {
  subtotal_iter(order, 0)
}

fn subtotal_iter(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [pizza, ..order] -> subtotal_iter(order, acc + pizza_price(pizza))
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_iter(pizza, 0)
}

pub fn pizza_price_iter(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> acc + 7
    Caprese -> acc + 9
    Formaggio -> acc + 10
    ExtraSauce(p) -> pizza_price_iter(p, acc + 1)
    ExtraToppings(p) -> pizza_price_iter(p, acc + 2)
  }
}

fn fee(order: List(Pizza)) -> Int {
  case order {
    [_] -> 3
    [_, _] -> 2
    _ -> 0
  }
}
