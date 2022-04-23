package expenses

type Record struct {
	Day      int
	Amount   float64
	Category string
}

type DaysPeriod struct {
	From int
	To   int
}

type EmptyCategoryErr string

func (category EmptyCategoryErr) Error() string {
	return "no records for category '" + string(category) + "'"
}

func Filter(records []Record, predicate func(Record) bool) []Record {
	result := []Record{}
	for _, record := range records {
		if predicate(record) {
			result = append(result, record)
		}
	}
	return result
}

func ByDaysPeriod(period DaysPeriod) func(Record) bool {
	return func(record Record) bool {
		return period.From <= record.Day && record.Day <= period.To
	}
}

func ByCategory(category string) func(Record) bool {
	return func(record Record) bool {
		return record.Category == category
	}
}

func TotalByPeriod(records []Record, period DaysPeriod) float64 {
	var total float64
	for _, r := range Filter(records, ByDaysPeriod(period)) {
		total += r.Amount
	}
	return total
}

func CategoryExpenses(records []Record, period DaysPeriod, category string) (float64, error) {
	fromCategory := Filter(records, ByCategory(category))
	if len(fromCategory) == 0 {
		return 0, EmptyCategoryErr(category)
	}
	return TotalByPeriod(fromCategory, period), nil
}
