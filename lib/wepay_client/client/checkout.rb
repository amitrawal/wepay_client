module WepayClient
  class Client
    module Checkout
      def get_checkout(checkout_id)
        post("checkout", {:checkout_id => checkout_id})
      end

      def create_checkout(params = {})
        defaults = {
            :fee_payer => 'Payee',
            :type => 'SERVICE',
            :charge_tax => 0,
            :app_fee => 0,
            :auto_capture => 1,
            :require_shipping => 0
        }.merge(params)
        post("checkout/create", defaults.merge(params))
      end

      def refund(checkout_id, params = {})
        post("checkout/refund", params.merge(:checkout_id => checkout_id))
      end
    end
  end
end
