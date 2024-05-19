import gleam/list
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  list.fold(dna, <<>>, fn(acc, nucleotide) {
    <<acc:bits, encode_nucleotide(nucleotide):2>>
  })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  decode_iter(dna, [])
}

fn decode_iter(dna: BitArray, decoded: List(Result(Nucleotide, Nil))) {
  case dna {
    <<>> -> result.all(decoded)
    <<value:2, rest:bits>> ->
      decode_iter(rest, list.append(decoded, [decode_nucleotide(value)]))
    _ -> Error(Nil)
  }
}
