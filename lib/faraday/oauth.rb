require 'faraday'

module FaradayMiddleware
  class WepayOAuth < Faraday::Middleware
    def call(env)
      if @access_token
        env[:request_headers] = env[:request_headers].merge('Authorization: Bearer' => @access_token)
      end
      @app.call env
    end

    def initialize(app, access_token=nil)
      @app = app
      @access_token = access_token
    end
  end
end
