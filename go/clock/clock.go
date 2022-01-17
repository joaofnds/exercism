package clock

import "fmt"

const minutesInADay = 24 * 60

type Clock int

func New(h, m int) Clock {
	m = (h*60 + m) % minutesInADay
	if m < 0 {
		m += minutesInADay
	}
	return Clock(m)
}

func (c Clock) Add(m int) Clock {
	return New(0, int(c)+m)
}

func (c Clock) Subtract(m int) Clock {
	return New(0, int(c)-m)
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c/60, c%60)
}
