package strain

type Ints []int
type Lists [][]int
type Strings []string

func (numbers Ints) Keep(predicate func(int) bool) Ints {
	var result Ints

	for _, n := range numbers {
		if predicate(n) {
			result = append(result, n)
		}
	}

	return result
}

func (numbers Ints) Discard(predicate func(int) bool) Ints {
	return numbers.Keep(func(n int) bool {
		return !predicate(n)
	})
}

func (numbers Lists) Keep(predicate func([]int) bool) Lists {
	var result Lists

	for _, n := range numbers {
		if predicate(n) {
			result = append(result, n)
		}
	}

	return result
}

func (strs Strings) Keep(predicate func(string) bool) Strings {
	var result Strings

	for _, str := range strs {
		if predicate(str) {
			result = append(result, str)
		}
	}

	return result
}
