package space

type Planet string

func Age(seconds float64, planet Planet) float64 {
	switch planet {
	case "Earth":
		return seconds / 31_557_600
	case "Mercury":
		return seconds / 7_600_543
	case "Venus":
		return seconds / 19_414_149
	case "Mars":
		return seconds / 59_354_032
	case "Jupiter":
		return seconds / 374_355_659
	case "Saturn":
		return seconds / 929_292_362
	case "Uranus":
		return seconds / 2_651_370_019
	case "Neptune":
		return seconds / 5_200_418_560
	default:
		return 0
	}
}
