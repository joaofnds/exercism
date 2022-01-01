package prime

func Factors(n int64) []int64 {
	f := []int64{}
	for i := int64(2); i <= n; i++ {
		for n%i == 0 {
			f = append(f, i)
			n /= i
		}
	}
	return f
}
