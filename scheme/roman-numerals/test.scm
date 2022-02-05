(load "roman-numerals.scm")

(use-modules (srfi srfi-64))

(test-begin "roman-numerals")

(test-equal "1 is a single I"
  (roman 1)
  "I")

(test-equal "2 is two I's"
  (roman 2)
  "II")

(test-equal "3 is three I's"
  (roman 3)
  "III")

(test-equal "4, being 5 - 1, is IV"
  (roman 4)
  "IV")

(test-equal "5 is a single V"
  (roman 5)
  "V")

(test-equal "6, being 5 + 1, is VI"
  (roman 6)
  "VI")

(test-equal "9, being 10 - 1, is IX"
  (roman 9)
  "IX")

(test-equal "20 is two X's"
  (roman 20)
  "XX")

(test-equal "27 is 10 + 10 + 5 + 1 + 1"
  (roman 27)
  "XXVII")

(test-equal "48 is not 50 - 2 but rather 40 + 8"
  (roman 48)
  "XLVIII")

(test-equal "49 is not 40 + 5 + 4 but rather 50 - 10 + 10 - 1"
  (roman 49)
  "XLIX")

(test-equal "50 is a single L"
  (roman 50)
  "L")

(test-equal "59 is 50 + 10 - 1"
  (roman 59)
  "LIX")

(test-equal "60, being 50 + 10, is LX"
  (roman 60)
  "LX")

(test-equal "90, being 100 - 10, is XC"
  (roman 90)
  "XC")

(test-equal "93 is 100 - 10 + 1 + 1 + 1"
  (roman 93)
  "XCIII")

(test-equal "100 is a single C"
  (roman 100)
  "C")

(test-equal "141 is 100 + 50 - 10 + 1"
  (roman 141)
  "CXLI")

(test-equal "163 is 100 + 50 + 10 + 1 + 1 + 1"
  (roman 163)
  "CLXIII")

(test-equal "400, being 500 - 100, is CD"
  (roman 400)
  "CD")

(test-equal "402 is 500 - 100 + 2"
  (roman 402)
  "CDII")

(test-equal "500 is a single D"
  (roman 500)
  "D")

(test-equal "575 is 500 + 50 + 10 + 10 + 5"
  (roman 575)
  "DLXXV")

(test-equal "900, being 1000 - 100, is CM"
  (roman 900)
  "CM")

(test-equal "911 is 1000 - 100 + 10 + 1"
  (roman 911)
  "CMXI")

(test-equal "1000 is a single M"
  (roman 1000)
  "M")

(test-equal "1024 is 1000 + 10 + 10 + 5 - 1"
  (roman 1024)
  "MXXIV")

(test-equal "3000 is three M's"
  (roman 3000)
  "MMM")

(test-end "roman-numerals")
