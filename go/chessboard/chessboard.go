package chessboard

type Rank []bool
type Chessboard map[int]Rank

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank
func CountInRank(cb Chessboard, rank int) (ret int) {
	r, ok := cb[rank]
	if !ok {
		return 0
	}

	result := 0
	for _, file := range r {
		if file {
			result++
		}
	}
	return result
}

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file
func CountInFile(cb Chessboard, file int) (ret int) {
	if file < 1 || file > 8 {
		return 0
	}

	result := 0
	for _, rank := range cb {
		if rank[file-1] {
			result++
		}
	}
	return result
}

// CountAll should count how many squares are present in the chessboard
func CountAll(cb Chessboard) (ret int) {
	result := 0
	for _, r := range cb {
		for range r {
			result++
		}
	}
	return result
}

// CountOccupied returns how many squares are occupied in the chessboard
func CountOccupied(cb Chessboard) (ret int) {
	result := 0
	for _, rank := range cb {
		for _, file := range rank {
			if file {
				result++
			}
		}
	}
	return result
}
