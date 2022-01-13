package luhn

func Valid(s string) bool {
	var sum, numDigits, i int

	for i = len(s) - 1; i >= 0; i-- {
		r := s[i]
		if r == ' ' {
			continue
		}
		if r < '0' || r > '9' {
			return false
		}

		numDigits++

		n := int(r - '0')
		if numDigits%2 == 0 {
			n = double(n)
		}
		sum += n
	}
	return numDigits > 1 && sum%10 == 0
}

func double(n int) int {
	if n > 4 {
		return 2*n - 9
	}
	return 2 * n
}
