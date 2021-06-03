class TwelveDays
  DAYS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth]

  GIFTS = [
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ]

  def self.song
    tail = ''

    DAYS.map.with_index do |day, i|
      tail = if i.zero?
               "#{GIFTS[0]}."
             elsif i == 1
               "#{GIFTS[1]}, and #{tail}"
             else
               "#{GIFTS[i]}, #{tail}"
             end

      "On the #{day} day of Christmas my true love gave to me: #{tail}\n\n"
    end.join.chomp
  end
end
