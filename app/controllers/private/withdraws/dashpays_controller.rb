module Private::Withdraws
  class DashpaysController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
