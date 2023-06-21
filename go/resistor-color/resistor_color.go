package resistorcolor

var colorCode = map[string]int{
	"black":  0,
	"brown":  1,
	"red":    2,
	"orange": 3,
	"yellow": 4,
	"green":  5,
	"blue":   6,
	"violet": 7,
	"grey":   8,
	"white":  9,
}

func Colors() []string {
	colors := make([]string, 0, len(colorCode))
	for color := range colorCode {
		colors = append(colors, color)
	}
	return colors
}

func ColorCode(color string) int {
	return colorCode[color]
}
