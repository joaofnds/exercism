package proverb

func Proverb(things []string) []string {
	result := []string{}

	if len(things) == 0 {
		return result
	}

	thingThatCausedItAll := things[0]

	previousThing := thingThatCausedItAll
	for _, thing := range things[1:] {
		result = append(result, "For want of a "+previousThing+" the "+thing+" was lost.")
		previousThing = thing
	}

	result = append(result, "And all for the want of a "+thingThatCausedItAll+".")

	return result
}
