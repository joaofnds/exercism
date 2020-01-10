module StrandErrors
  class StrandLengthsError < ArgumentError
    def initialize(message = 'strands must have equal lengths')
      super
    end
  end
end
