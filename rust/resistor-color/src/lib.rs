#[derive(Debug, PartialEq, Eq)]
pub enum ResistorColor {
    Black,
    Blue,
    Brown,
    Green,
    Grey,
    Orange,
    Red,
    Violet,
    White,
    Yellow,
}

pub fn color_to_value(color: ResistorColor) -> u32 {
    match color {
        ResistorColor::Black => 0,
        ResistorColor::Brown => 1,
        ResistorColor::Red => 2,
        ResistorColor::Orange => 3,
        ResistorColor::Yellow => 4,
        ResistorColor::Green => 5,
        ResistorColor::Blue => 6,
        ResistorColor::Violet => 7,
        ResistorColor::Grey => 8,
        ResistorColor::White => 9,
    }
}

pub fn value_to_color_string(value: u32) -> String {
    match value {
        0 => "Black".to_string(),
        1 => "Brown".to_string(),
        2 => "Red".to_string(),
        3 => "Orange".to_string(),
        4 => "Yellow".to_string(),
        5 => "Green".to_string(),
        6 => "Blue".to_string(),
        7 => "Violet".to_string(),
        8 => "Grey".to_string(),
        9 => "White".to_string(),
        _ => "value out of range".to_string(),
    }
}

pub fn colors() -> Vec<ResistorColor> {
    return vec![
        ResistorColor::Black,
        ResistorColor::Brown,
        ResistorColor::Red,
        ResistorColor::Orange,
        ResistorColor::Yellow,
        ResistorColor::Green,
        ResistorColor::Blue,
        ResistorColor::Violet,
        ResistorColor::Grey,
        ResistorColor::White,
    ];
}
