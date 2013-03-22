The WePay Ruby Gem
====================
This is a simple ruby client to interact with wepay apis.

Installation
------------
	gem install wepay_client


API Usage Examples
------------------
    require "rubygems"
    require 'wepay_client'

    wepay = WepayClient::Client..new(:access_token => 'xyz')
    account = wepay.get_account(1122334)


Getting access token
------------------
    Some where inside an action in your rails app
    CALLBACK_URL = "http://localhost:4567/callback"
    def connect

        wepay = WepayClient::Client..new(:client_id => '123456', :client_secret => 'secret')
        wepay_auth_url = wepay.auth_code_url(CALLBACK_URL)
        redirect_to 'callback'
    end


    def callback
        client = WepayClient::Client..new(:client_id => '123456', :client_secret => 'secret')
        response = client.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    	session[:access_token] = response['access_token']
    	redirect_to "/account"
    end

    def account
      client = WepayClient::Client..new(:access_token => session[:access_token])
      account = client.get_account('122212')
    end


