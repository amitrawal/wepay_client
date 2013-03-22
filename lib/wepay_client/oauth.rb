module WepayClient
  module OAuth
    # this function returns the URL that you send the user to to authorize your API application
    # the redirect_uri must be a full uri (ex https://www.wepay.com)
    def auth_code_url(redirect_uri, user_email = false, user_name = false, permissions = DEFAULT_SCOPE)
      url = ui_endpoint + "#{ui_endpoint}/oauth2/authorize?client_id=?#{client_id.to_s}&redirect_uri=#{redirect_uri}&scope=#{permissions}"
      url += user_name ? '&user_name=' + CGI::escape(user_name) : ''
      url += user_email ? '&user_email=' + CGI::escape(user_email) : ''
      url
    end

    # this function makes a call to the oauth2/token endpoint to exchange a code for an access_token
    def get_access_token(code, redirect_uri)
      response = post('/oauth2/token', {'client_id' => client_id, 'client_secret' => client_secret, 'redirect_uri' => redirect_uri, 'code' => code })
      response
    end
  end
end