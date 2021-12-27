package robotname

import (
	"errors"
	"fmt"
	"math/rand"
)

type Robot struct {
	name string
}

const numAvailableNames = 676000

var (
	names              = rand.Perm(numAvailableNames)
	nameIdx            = 0
	nameCapExceededErr = errors.New("name capacity exceeded")
)

func issueName() (string, error) {
	if nameIdx >= numAvailableNames {
		return "", nameCapExceededErr
	}

	name := currName()
	nameIdx++

	return name, nil
}

func currName() string {
	n := names[nameIdx]

	return string(fmt.Sprintf("%c%c%d%d%d",
		'A'+n/26000,
		'A'+n%26000/1000,
		n%1000/100,
		n%100/10,
		n%10,
	))
}

func (r *Robot) Name() (string, error) {
	if r.name != "" {
		return r.name, nil
	}

	name, err := issueName()
	if err != nil {
		return "", err
	}

	r.name = name
	return name, nil
}

func (r *Robot) Reset() {
	r.name = ""
}
