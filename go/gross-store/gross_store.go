package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	if u, ok := units[unit]; ok {
		bill[item] = u
		return true
	} else {
		return false
	}
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	i, ok := bill[item]
	if !ok {
		return false
	}

	u, ok := units[unit]
	if !ok {
		return false
	}

	newQuantity := i - u
	if newQuantity < 0 {
		return false
	} else if newQuantity == 0 {
		delete(bill, item)
		return true
	} else {
		bill[item] = newQuantity
		return true
	}
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	i, ok := bill[item]
	return i, ok
}
