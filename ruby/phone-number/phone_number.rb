class PhoneNumber
  RE = REGULAR_EXPRESSION = {
    digits: /\d+/,
    country: /1/,
    area: /[2-9]\d{2}/,
    city: /[2-9]\d{2}/,
    number: /\d{4}/
  }.freeze

  def self.clean(number)
    new(number).clean
  end

  def clean
    captures = @digits.match(nanp_format)&.named_captures

    "#{captures['area']}#{captures['city']}#{captures['number']}" if captures
  end

  private

  attr_reader :digits

  def initialize(number)
    @digits = number.scan(RE[:digits]).join
  end

  def nanp_format
    /^(?<country>#{RE[:country]})?(?<area>#{RE[:area]})(?<city>#{RE[:city]})(?<number>#{RE[:number]})$/
  end
end
