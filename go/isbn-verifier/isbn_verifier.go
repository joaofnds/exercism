package isbn

func IsValidISBN(isbn string) bool {
	digits, checksum := 0, 0

	for _, digit := range isbn {
		if validISBNDigit(digit, digits+1) {
			checksum += isbnValue(digit) * (10 - digits)
			digits++
		}
	}

	return digits == 10 && checksum%11 == 0
}

func validISBNDigit(digit rune, pos int) bool {
	return '0' <= digit && digit <= '9' || digit == 'X' && pos == 10
}

func isbnValue(digit rune) int {
	if digit == 'X' {
		return 10
	}

	return int(digit - '0')
}
