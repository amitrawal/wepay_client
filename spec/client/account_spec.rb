require 'spec_helper'


describe 'WepayClient account methods' do
  before(:all) do
    @client = WepayClient::Client.new(:access_token => 'a_valid_token')
  end

  describe '.get_token' do
    it 'gets the account details' do
      stub_request(:post, "https://stage.wepayapi.com/v2/account").with(:headers => {'Authorization: Bearer' => 'a_valid_token'}).to_return(:body => fixture('account/get_account_response.json'))

      account = @client.get_account(12345)
      account['account_id'].should == 12345
    end
  end

  describe '.create_account' do
    it 'creates an account' do
      request_params = fixture('account/create_request.json').read
      stub_request(:post, "https://stage.wepayapi.com/v2/account/create").with(
          :headers => {'Authorization: Bearer' => 'a_valid_token'}
      ).to_return(:body => fixture('account/get_account_response.json'))

      account = @client.create_account(::JSON.parse(request_params))
      account['account_id'].should == 12345
    end
  end

  describe '.find' do
    it 'finds accounts' do
      request_params = fixture('account/find_request.json').read

      stub_request(:post, "https://stage.wepayapi.com/v2/account/find").with(
          :headers => {'Authorization: Bearer' => 'a_valid_token'}
      ).to_return(:body => fixture('account/find_response.json'))

      accounts = @client.find_account(::JSON.parse(request_params))
      accounts.length.should > 0
      accounts.first['account_id'].should_not be_nil
    end
  end

  describe '.modify_account' do
    it 'updates an account' do
      request_params = fixture('account/modify_request.json').read

      stub_request(:post, "https://stage.wepayapi.com/v2/account/modify").with(
          :headers => {'Authorization: Bearer' => 'a_valid_token'}
      ).to_return(:body => fixture('account/modify_response.json'))

      account = @client.modify_account(12345, ::JSON.parse(request_params))
      account['account_id'].should_not be_nil
    end
  end
end
