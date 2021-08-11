package listops

type IntList []int
type binFunc func(x, y int) int
type predFunc func(n int) bool
type unaryFunc func(n int) int

func (list IntList) Foldl(fn binFunc, init int) int {
	result := init

	for _, v := range list {
		result = fn(result, v)
	}

	return result
}

func (list IntList) Foldr(fn binFunc, init int) int {
	result := init
	l := len(list)

	for i := range list {
		result = fn(list[l-1-i], result)
	}

	return result
}

func (list IntList) Filter(fn predFunc) IntList {
	result := IntList{}

	for _, v := range list {
		if fn(v) {
			result = append(result, v)
		}
	}

	return result
}

func (list IntList) Length() int {
	return len(list)
}

func (list IntList) Map(fn unaryFunc) IntList {
	result := make(IntList, len(list))

	for i, v := range list {
		result[i] = fn(v)
	}

	return result
}

func (list IntList) Reverse() IntList {
	l := len(list)
	result := make(IntList, l)

	for i, v := range list {
		result[l-1-i] = v
	}

	return result
}

func (list IntList) Append(items IntList) IntList {
	listLen := len(list)
	result := make(IntList, listLen+len(items))

	for i, v := range list {
		result[i] = v
	}

	for i, v := range items {
		result[listLen+i] = v
	}

	return result
}

func (list IntList) Concat(lists []IntList) IntList {
	result := IntList{}.Append(list)

	for _, l := range lists {
		result = result.Append(l)
	}

	return result
}
