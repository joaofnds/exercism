package tournament

import (
	"bufio"
	"errors"
	"fmt"
	"io"
	"sort"
	"strconv"
	"strings"
)

var (
	ErrBadInput = errors.New("bad input")
)

type Score struct {
	team   string
	played int
	won    int
	tied   int
	lost   int
	points int
}

func Tally(reader io.Reader, writer io.Writer) error {
	scoreByName, err := parse(reader)
	if err != nil {
		return err
	}

	sortedScores := sortScores(scoreByName)
	return writeResults(writer, sortedScores)
}

func parse(r io.Reader) (map[string]*Score, error) {
	scanner := bufio.NewScanner(r)
	tournament := map[string]*Score{}

	for scanner.Scan() {
		line := scanner.Text()
		if line == "" || line[0] == '#' {
			continue
		}

		entry := strings.Split(line, ";")
		if len(entry) != 3 {
			return nil, fmt.Errorf("line doesn't have 3 fields %q", line)
		}
		t1, t2, result := entry[0], entry[1], entry[2]

		if _, ok := tournament[t1]; !ok {
			tournament[t1] = &Score{team: t1}
		}

		if _, ok := tournament[t2]; !ok {
			tournament[t2] = &Score{team: t2}
		}

		tournament[t1].played++
		tournament[t2].played++

		switch result {
		case "win":
			tournament[t1].won++
			tournament[t1].points += 3

			tournament[t2].lost++
		case "draw":
			tournament[t1].tied++
			tournament[t1].points++

			tournament[t2].tied++
			tournament[t2].points++
		case "loss":
			tournament[t1].lost++

			tournament[t2].won++
			tournament[t2].points += 3
		default:
			return nil, fmt.Errorf("invalid result %q", result)
		}
	}

	return tournament, nil
}

func sortScores(scoresByName map[string]*Score) []*Score {
	scores := make([]*Score, 0, len(scoresByName))
	for _, score := range scoresByName {
		scores = append(scores, score)
	}

	sort.Slice(scores, func(i, j int) bool {
		switch {
		case scores[i].points > scores[j].points:
			return true
		case scores[i].points == scores[j].points:
			return scores[i].team < scores[j].team
		default:
			return false
		}
	})

	return scores
}

func writeResults(w io.Writer, results []*Score) error {
	err := writeLine(w, "Team", "MP", "W", "D", "L", "P")
	if err != nil {
		return err
	}

	for _, score := range results {
		err = writeLine(
			w,
			score.team,
			strconv.Itoa(score.played),
			strconv.Itoa(score.won),
			strconv.Itoa(score.tied),
			strconv.Itoa(score.lost),
			strconv.Itoa(score.points),
		)

		if err != nil {
			return err
		}
	}

	return nil
}

func writeLine(wr io.Writer, team, mp, w, d, l, p string) error {
	_, err := fmt.Fprintf(wr, "%-30s | %2s | %2s | %2s | %2s | %2s\n", team, mp, w, d, l, p)
	return err
}
