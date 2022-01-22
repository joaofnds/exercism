package tree

import (
	"errors"
	"sort"
)

var (
	notInSeqErr  = errors.New("not in sequence")
	badParentErr = errors.New("bad parent")
)

type Node struct {
	ID       int
	Children []*Node
}

func (n *Node) appendChild(child *Node) {
	n.Children = append(n.Children, child)
}

type Record struct {
	ID     int
	Parent int
}

func Build(records []Record) (*Node, error) {
	sort.Slice(records, func(i, j int) bool {
		return records[i].ID < records[j].ID
	})

	node := make(map[int]*Node, len(records))

	for i, r := range records {
		if err := validateRecord(i, r); err != nil {
			return nil, err
		}

		node[i] = &Node{ID: i}
		if i != 0 {
			node[r.Parent].appendChild(node[i])
		}
	}

	return node[0], nil
}

func validateRecord(pos int, r Record) error {
	switch {
	case r.ID != pos:
		return notInSeqErr
	case r.ID < r.Parent:
		return badParentErr
	case r.ID > 0 && r.Parent == r.ID:
		return badParentErr
	default:
		return nil
	}
}
