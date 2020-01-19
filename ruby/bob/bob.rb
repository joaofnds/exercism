class Bob
  def self.hey(sentence)
    new(sentence).answer
  end

  def answer
    if silence?
      'Fine. Be that way!'
    elsif question? and yell?
      "Calm down, I know what I'm doing!"
    elsif question?
      'Sure.'
    elsif yell?
      'Whoa, chill out!'
    else
      'Whatever.'
    end
  end

  private

  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence.strip
  end

  def question?
    sentence.end_with? '?'
  end

  def yell?
    sentence.upcase == sentence and letters?
  end

  def silence?
    sentence.empty?
  end

  def letters?
    sentence.downcase != sentence.upcase
  end
end
