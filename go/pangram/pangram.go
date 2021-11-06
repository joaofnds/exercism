package pangram

func IsPangram(input string) bool {
	var bitSet int32
	for _, r := range input {
		pos := (r & 0x5f) - 'A'
		if 0 <= pos && pos <= 26 {
			bitSet |= 1 << pos
		}
	}
	return bitSet == 0x3ffffff
}
