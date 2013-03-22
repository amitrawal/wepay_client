module WepayClient
  class Client
    module Account
      def create_account(params = {})
        post("account/create", params)
      end

      def get_account(id)
        post("account", {:account_id => id})
      end

      def find_account(params = {})
        post("account/find", params)
      end

      def modify_account(account_id, params={})
        post("account/modify", params.merge({:account_id => account_id}))
      end

      def delete_account(account_id)
        post("account/delete", {:account_id => account_id})
      end

      def get_account_balance(account_id)
        post("account/balance", {:account_id => account_id})
      end
    end
  end
end