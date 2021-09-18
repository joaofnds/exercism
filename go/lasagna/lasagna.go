package lasagna

const OvenTime = 40

func RemainingOvenTime(elapsed int) int {
	return OvenTime - elapsed
}

func PreparationTime(layers int) int {
	return layers * 2
}

func ElapsedTime(layers, elapsed int) int {
	return PreparationTime(layers) + elapsed
}
