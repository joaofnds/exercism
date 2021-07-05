package triangle

import (
	"math"
	"testing"
)

type testCase struct {
	want    Kind
	a, b, c float64
}

// basic test cases
var testData = []testCase{
	{Equilateral, 2, 2, 2},    // same length
	{Equilateral, 10, 10, 10}, // a little bigger
	{Isosceles, 3, 4, 4},    // last two sides equal
	{Isosceles, 4, 3, 4},    // first and last sides equal
	{Isosceles, 4, 4, 3},    // first two sides equal
	{Isosceles, 10, 10, 2},  // again
	{Isosceles, 2, 4, 2},    // a "triangle" that is just a line is still OK
	{Scalene, 3, 4, 5},    // no sides equal
	{Scalene, 10, 11, 12}, // again
	{Scalene, 5, 4, 2},    // descending order
	{Scalene, .4, .6, .3}, // small sides
	{Scalene, 1, 4, 3},    // a "triangle" that is just a line is still OK
	{Scalene, 5, 4, 6},    // 2a == b+c looks like equilateral, but isn't always.
	{Scalene, 6, 4, 5},    // 2a == b+c looks like equilateral, but isn't always.
	{NotATriangle, 0, 0, 0},    // zero length
	{NotATriangle, 3, 4, -5},   // negative length
	{NotATriangle, 1, 1, 3},    // fails triangle inequality
	{NotATriangle, 2, 5, 2},    // another
	{NotATriangle, 7, 3, 2},    // another
}

// generate cases with NaN and Infs, append to basic cases
func init() {
	nan := math.NaN()
	pinf := math.Inf(1)
	ninf := math.Inf(-1)
	nf := make([]testCase, 4*4*4)
	i := 0
	for _, a := range []float64{3, nan, pinf, ninf} {
		for _, b := range []float64{4, nan, pinf, ninf} {
			for _, c := range []float64{5, nan, pinf, ninf} {
				nf[i] = testCase{NotATriangle, a, b, c}
				i++
			}
		}
	}
	testData = append(testData, nf[1:]...)
}

// Test that the kinds are not equal to each other.
// If they are equal, then TestKind will return false positives.
func TestKindsNotEquilateralal(t *testing.T) {
	kindsAndNames := []struct {
		kind Kind
		name string
	}{
		{Equilateral, "Equilateral"},
		{Isosceles, "Isosceles"},
		{Scalene, "Scalene"},
		{NotATriangle, "NotATriangle"},
	}

	for i, pair1 := range kindsAndNames {
		for j := i + 1; j < len(kindsAndNames); j++ {
			pair2 := kindsAndNames[j]
			if pair1.kind == pair2.kind {
				t.Fatalf("%s should not be equal to %s", pair1.name, pair2.name)
			}
		}
	}
}

func TestKind(t *testing.T) {
	for _, test := range testData {
		got := KindFromSides(test.a, test.b, test.c)
		if got != test.want {
			t.Fatalf("Triangle with sides, %g, %g, %g = %v, want %v",
				test.a, test.b, test.c, got, test.want)
		}
	}
}

func BenchmarkKind(b *testing.B) {
	for i := 0; i < b.N; i++ {
		for _, test := range testData {
			KindFromSides(test.a, test.b, test.c)
		}
	}
}
