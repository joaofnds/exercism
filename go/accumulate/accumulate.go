package accumulate

func Accumulate(in []string, conv func(string) string) []string {
	result := make([]string, len(in))

	for i, v := range in {
		result[i] = conv(v)
	}

	return result
}
