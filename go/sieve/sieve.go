package sieve

func Sieve(limit int) []int {
	marks := make([]bool, limit+1)
	primes := make([]int, limit/2)
	var nprimes int

	for i := 2; i <= limit; i++ {
		marked := marks[i]
		if !marked {
			primes[nprimes] = i
			nprimes++
			for j := 1; ; j++ {
				k := i * j
				if k > limit {
					break
				}
				marks[k] = true
			}
		}
	}
	return primes[:nprimes]
}
