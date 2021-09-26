// Package weather provides ability to check weather forecast for cities.
package weather

// CurrentCondition represents current weather conditions.
var CurrentCondition string
// CurrentLocation represents current geographical location.
var CurrentLocation string

// Forecast returns a string that shows current weather conditions for a given location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
