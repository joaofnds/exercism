pub enum LogLevel {
    Info,
    Warning,
    Error,
}

fn level_str(level: LogLevel) -> &'static str {
    match level {
        LogLevel::Info => "INFO",
        LogLevel::Warning => "WARNING",
        LogLevel::Error => "ERROR",
    }
}

pub fn log(level: LogLevel, message: &str) -> String {
    format!("[{}]: {}", level_str(level), message)
}

pub fn info(message: &str) -> String {
    log(LogLevel::Info, message)
}

pub fn warn(message: &str) -> String {
    log(LogLevel::Warning, message)
}

pub fn error(message: &str) -> String {
    log(LogLevel::Error, message)
}
