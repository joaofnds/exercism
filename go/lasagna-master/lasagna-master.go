package lasagna

func PreparationTime(layers []string, time int) int {
	if time == 0 {
		time = 2
	}

	return time * len(layers)
}

func Quantities(layers []string) (int, float64) {
	var gramsOfNoodles int
	var litersOfSauce float64

	for _, layer := range layers {
		if layer == "noodles" {
			gramsOfNoodles += 50
		}
		if layer == "sauce" {
			litersOfSauce += 0.2
		}
	}

	return gramsOfNoodles, litersOfSauce
}

func AddSecretIngredient(friendList, myList []string) []string {
	return append(myList, friendList[len(friendList)-1])
}

func ScaleRecipe(quantities []float64, amount int) []float64 {
	result := make([]float64, len(quantities))

	for i, q := range quantities {
		result[i] = (q / 2) * float64(amount)
	}

	return result
}
