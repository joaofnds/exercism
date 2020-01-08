# frozen_string_literal: true

module HammingErrors
  class DifferentLengthSequencesError < ArgumentError
    def initialize(message = 'sequences must have the same length')
      super
    end
  end
end
