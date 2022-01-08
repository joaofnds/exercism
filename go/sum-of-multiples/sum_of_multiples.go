package summultiples

func SumMultiples(limit int, divisors ...int) int {
	var sum int
	for n := 0; n < limit; n++ {
		for _, div := range divisors {
			if div != 0 && n%div == 0 {
				sum += n
				break
			}
		}
	}
	return sum
}
