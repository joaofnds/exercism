use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut magazine_words = HashMap::new();

    for word in magazine {
        *magazine_words.entry(word).or_insert(0) += 1;
    }

    for word in note {
        *magazine_words.entry(word).or_insert(0) -= 1;
    }

    magazine_words.values().all(|&x| x >= 0)
}
