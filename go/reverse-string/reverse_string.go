package reverse

func Reverse(s string) string {
	out := []rune(s)
	len := len(out)

	for i := 0; i < len/2; i++ {
		out[i], out[len-i-1] = out[len-i-1], out[i]
	}

	return string(out)
}
