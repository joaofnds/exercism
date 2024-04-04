import gleam/option.{type Option, None, Some}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  let new_mana = case player.level > 9 {
    True -> Some(100)
    False -> None
  }

  case player.health {
    0 -> Some(Player(..player, health: 100, mana: new_mana))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(
      Player(..player, mana: Some(mana - cost)),
      2 * cost,
    )
    None -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
    _ -> #(player, 0)
  }
}
