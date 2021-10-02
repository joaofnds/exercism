package cards

// GetItem retrieves an item from a slice at given position. The second return value indicates whether
// a the given index existed in the slice or not.
func GetItem(slice []int, index int) (int, bool) {
	if !isIndexValid(slice, index) {
		return 0, false
	}

	return slice[index], true
}

// SetItem writes an item to a slice at given position overwriting an existing value.
// If the index is out of range it is be appended.
func SetItem(slice []int, index, value int) []int {
	if !isIndexValid(slice, index) {
		return append(slice, value)
	}

	slice[index] = value
	return slice
}

// PrefilledSlice creates a slice of given length and prefills it with the given value.
func PrefilledSlice(value, length int) []int {
	result := []int{}

	for i := 0; i < length; i++ {
		result = append(result, value)
	}

	return result
}

// RemoveItem removes an item from a slice by modifying the existing slice.
func RemoveItem(slice []int, index int) []int {
	if !isIndexValid(slice, index) {
		return slice
	}

	return append(slice[:index], slice[index+1:]...)
}

// isIndexValid checks if a given index is valid inside a given slice
func isIndexValid(slice []int, index int) bool {
	return 0 <= index && index < len(slice)
}
