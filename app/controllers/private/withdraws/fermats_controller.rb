module Private::Withdraws
  class FermatsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
