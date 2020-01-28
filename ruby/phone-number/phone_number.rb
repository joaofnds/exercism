class PhoneNumber
  RE = REGULAR_EXPRESSION = {
    digits:                   /\d+/,
    country_code:             /1/,
    numbering_plan_area_code: /[2-9]\d{2}/,
    central_office_code:      /[2-9]\d{2}/,
    line_number:              /\d{4}/
  }.freeze

  def self.clean(number)
    just_digits = number.scan(RE[:digits]).join

    country     = RE[:country_code]
    area        = RE[:numbering_plan_area_code]
    co_code     = RE[:central_office_code]
    line_number = RE[:line_number]

    nanp = /^#{country}?(#{area}#{co_code}#{line_number})$/

    just_digits.match(nanp)&.captures&.first
  end
end
