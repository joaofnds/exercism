package flatten

func Flatten(nested interface{}) []interface{} {
	result := []interface{}{}

	for _, v := range nested.([]interface{}) {
		switch v.(type) {
		case nil:
			continue
		case []interface{}:
			result = append(result, Flatten(v)...)
		default:
			result = append(result, v)
		}
	}

	return result
}
