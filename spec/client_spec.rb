require 'spec_helper'

describe 'WepayClient::Client' do
  before(:all) do
    @client = WepayClient::Client.new(:access_token => 'a_valid_token')
  end

  it 'raises error if request status is 400 or more' do
    stub_request(:post, /https:\/\/stage.wepayapi.com\/v2\.*/).with(:headers => {'Authorization: Bearer' => 'a_valid_token'}).to_return(:status => 401, :body => fixture('error.json'))
    expect do
      @client.find_account
    end.to raise_error WepayClient::Error
  end

  it 'can get access token' do
    stub_request(:post, 'https://stage.wepayapi.com/v2/oauth2/token').to_return(:body => fixture('access_token_success.json'))
    token = @client.get_access_token('code', 'http://example.com')
    token['access_token'].should_not be_nil
  end
end