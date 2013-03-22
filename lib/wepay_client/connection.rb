require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f|require f}

module WepayClient
  # @private
  module Connection
    private

    def connection
      options = {
          :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
          :ssl => {:verify => false},
          :url => endpoint,
      }

      Faraday::Connection.new(options) do |connection|
        connection.use FaradayMiddleware::WepayOAuth, access_token
        case format.to_s.downcase
          when 'json' then
            connection.request :json
            connection.use Faraday::Response::ParseJson
        end
        connection.use FaradayMiddleware::RaiseHttpException
        connection.adapter(adapter)
      end
    end
  end
end
