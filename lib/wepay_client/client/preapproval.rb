module WepayClient
  class Client
    module Preapproval
      PREAPPROVAL_PERIODS = {
          :hourly   => 'hourly',
          :daily    => 'daily',
          :weekly   => 'weekly',
          :biweekly => 'biweekly',
          :monthly  => 'monthly',
          :quarterly=> 'quarterly',
          :yearly   => 'yearly',
          :once     => 'once'
      }

      def create_preapproval(params = {})
        defaults = {
            :frequency => 10
        }

        post("preapproval/create", defaults.merge(params))
      end

      def get_preapproval(preapproval_id)
        post("preapproval", {:preapproval_id => preapproval_id})
      end

      def cancel_preapproval(preapproval_id)
        post("preapproval/cancel", {:preapproval_id => preapproval_id})
      end
    end
  end
end