require 'faraday'

module FaradayMiddleware
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        if response[:status] >= 400
          raise WepayClient::Error, error_message(response)
        end
      end
    end
    def error_message(response)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}#{error_body(response[:body])}"
    end

    def error_body(body)
      if not body.nil? and not body.empty? and body.kind_of?(String)
        body = ::JSON.parse(body)
      end

      if body.nil?
        nil
      elsif body['error'] && body['error_description'] && body['error_code']
        ": #{body['error_code']} - #{body['error']} - #{body['error_description']}"
      end
    end

    def initialize(app)
      super app
    end

  end
end