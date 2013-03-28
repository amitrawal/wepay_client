module WepayClient
  # Wrapper for the WePay REST API

  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include WepayClient::Client::Account
    include WepayClient::Client::Checkout
    include WepayClient::Client::Preapproval
  end
end