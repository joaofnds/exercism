use std::cmp::min;

pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    fn new(level: u32) -> Player {
        Self {
            level,
            health: 100,
            mana: level.ge(&10).then(|| 100),
        }
    }

    pub fn revive(&self) -> Option<Player> {
        match self.health {
            0 => Some(Player::new(self.level)),
            _ => None,
        }
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        match self.mana {
            Some(x) => {
                if x >= mana_cost {
                    self.mana = Some(x - mana_cost);
                    2 * mana_cost
                } else {
                    0
                }
            }
            None => {
                self.health -= min(self.health, mana_cost);
                0
            }
        }
    }
}
