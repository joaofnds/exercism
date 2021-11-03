class TeamStatus
  attr_reader :team, :wins, :losses, :draws, :matches

  def won
    @wins += 1
    @matches += 1
  end

  def lost
    @losses += 1
    @matches += 1
  end

  def tied
    @draws += 1
    @matches += 1
  end

  def points
    wins * 3 + draws
  end

  def <=>(other)
    point_diff = -(points <=> other.points)
    name_diff = team <=> other.team

    !point_diff.zero? ? point_diff : name_diff
  end

  private

  def initialize(team)
    @team = team
    @wins = 0
    @losses = 0
    @draws = 0
    @matches = 0
  end
end

class Tournament
  def self.tally(results)
    new(results.strip.lines.map(&:strip)).pretty
  end

  def pretty
    [header, *tournament_stats].join("\n") + "\n"
  end

  private

  attr_reader :teams

  def initialize(results)
    @teams = {}

    results.each do |line|
      team_a, team_b, result = line.split(';')
      ingest_result(team_a, team_b, result)
    end
  end

  def ingest_result(team_a, team_b, result)
    a_stats = ingest_team(team_a)
    b_stats = ingest_team(team_b)

    case result
    when 'win'
      a_stats.won
      b_stats.lost
    when 'loss'
      a_stats.lost
      b_stats.won
    when 'draw'
      a_stats.tied
      b_stats.tied
    end
  end

  def ingest_team(name)
    teams[name] ||= TeamStatus.new(name)
  end

  def header
    format_line('Team', 'MP', 'W', 'D', 'L', 'P')
  end

  def tournament_stats
    teams.each_value.sort.map do |stats|
      format_line(
        stats.team,
        stats.matches,
        stats.wins,
        stats.draws,
        stats.losses,
        stats.points
      )
    end
  end

  def format_line(team, mp, w, d, l, p)
    format('%-30s | %2s | %2s | %2s | %2s | %2s', team, mp, w, d, l, p)
  end
end

if $PROGRAM_NAME == __FILE__
  input = <<~INPUT
    Blithering Badgers;Allegoric Alaskans;win
  INPUT

  expected = <<~TALLY
    Team                           | MP |  W |  D |  L |  P
    Blithering Badgers             |  1 |  1 |  0 |  0 |  3
    Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0
  TALLY

  puts Tournament.tally(input)
end
