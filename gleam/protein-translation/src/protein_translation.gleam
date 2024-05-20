import gleam/list

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  translate(rna, [])
}

fn translate(rna: String, acc: List(String)) -> Result(List(String), Nil) {
  case rna {
    "AUG" <> rest -> translate(rest, ["Methionine", ..acc])
    "UUU" <> rest | "UUC" <> rest -> translate(rest, ["Phenylalanine", ..acc])
    "UUA" <> rest | "UUG" <> rest -> translate(rest, ["Leucine", ..acc])
    "UCU" <> rest | "UCC" <> rest | "UCA" <> rest | "UCG" <> rest -> translate(rest, ["Serine", ..acc])
    "UAU" <> rest | "UAC" <> rest -> translate(rest, ["Tyrosine", ..acc])
    "UGU" <> rest | "UGC" <> rest -> translate(rest, ["Cysteine", ..acc])
    "UGG" <> rest -> translate(rest, ["Tryptophan", ..acc])
    "UAA" <> _ | "UAG" <> _ | "UGA" <> _ | "" -> Ok(list.reverse(acc))
    _ -> Error(Nil)
  }
}
