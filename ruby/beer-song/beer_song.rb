class BeerSong
  class << self
    def recite(start, size)
      start.downto(start - size + 1).map { verse _1 }.join("\n")
    end

    def verse(bottles)
      case bottles
      when 0
        <<~VERSE
          No more bottles of beer on the wall, no more bottles of beer.
          Go to the store and buy some more, 99 bottles of beer on the wall.
        VERSE
      when 1
        <<~VERSE
          1 bottle of beer on the wall, 1 bottle of beer.
          Take it down and pass it around, no more bottles of beer on the wall.
        VERSE
      when 2
        <<~VERSE
          2 bottles of beer on the wall, 2 bottles of beer.
          Take one down and pass it around, 1 bottle of beer on the wall.
        VERSE
      else
        <<~VERSE
          #{bottles} bottles of beer on the wall, #{bottles} bottles of beer.
          Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.
        VERSE
      end
    end
  end
end
