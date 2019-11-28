class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    sorted_scores.first
  end

  def personal_top_three
    sorted_scores.first(3)
  end

  def latest_is_personal_best?
    sorted_scores.first == scores.last
  end

  private

  def sorted_scores
    @sorted_scores ||= scores.sort { |a, b| b - a } # sort desc
  end
end
