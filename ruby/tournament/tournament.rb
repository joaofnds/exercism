class Team
  POINTS_PER_WIN = 3
  POINTS_PER_DRAW = 1

  attr_reader :name, :wins, :losses, :draws

  def won
    @wins += 1
  end

  def lost
    @losses += 1
  end

  def tied
    @draws += 1
  end

  def matches
    wins + losses + draws
  end

  def points
    wins * POINTS_PER_WIN + draws * POINTS_PER_DRAW
  end

  private

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @draws = 0
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

  HEADER_FORMAT = '%-30s | %2s | %2s | %2s | %2s | %2s'

  private_constant :HEADER_FORMAT
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
    teams[name] ||= Team.new(name)
  end

  def header
    format_line('Team', 'MP', 'W', 'D', 'L', 'P')
  end

  def tournament_stats
    teams.each_value.sort_by { |stats| [-stats.points, stats.name] }.map do |stats|
      format_line(
        stats.name,
        stats.matches,
        stats.wins,
        stats.draws,
        stats.losses,
        stats.points
      )
    end
  end

  def format_line(team, mp, w, d, l, p)
    format(HEADER_FORMAT, team, mp, w, d, l, p)
  end
end
