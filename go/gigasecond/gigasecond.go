package gigasecond

import "time"

func AddGigasecond(t time.Time) time.Time {
	return t.Add(1e9 * time.Second)
}
