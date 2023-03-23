#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stack: Vec<i32> = Vec::new();
    for input in inputs {
        match input {
            CalculatorInput::Value(x) => stack.push(*x),
            _ => match (stack.pop(), stack.pop()) {
                (Some(a), Some(b)) => match input {
                    CalculatorInput::Add => stack.push(b + a),
                    CalculatorInput::Subtract => stack.push(b - a),
                    CalculatorInput::Multiply => stack.push(b * a),
                    CalculatorInput::Divide => stack.push(b / a),
                    _ => return None,
                },
                _ => return None,
            },
        }
    }

    match stack.len() {
        1 => stack.pop(),
        _ => None,
    }
}
