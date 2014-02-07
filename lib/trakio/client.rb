require 'rest_client'

module TrakIO

  class Client
    ENDPOINTS = {
      identify: "https://api.trak.io/v1/identify",
      track: "https://api.trak.io/v1/track",
      annotate: "https://api.trak.io/v1/annotate",
      alias: "https://api.trak.io/v1/alias"
    }

    attr_reader :api_token

    def initialize(api_token)
      @api_token = api_token
    end

    def request(type, data)
      endpoint = TrakIO::Client::ENDPOINTS[type]
      uri = URI(endpoint)

      RestClient.post(endpoint, { data: data, token: @api_token }.to_json, 
        content_type: :json, 
        accept: :json,
        user_agent: "Metaware/RubyClient/v#{TrakIO::VERSION}"
      )
    end
    
  end

end