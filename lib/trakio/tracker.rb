module TrakIO

  class Tracker

    attr_reader :token, :options

    def initialize(token, options = nil)
      @token = token
      @options = options
    end

  end

end