module Private::Withdraws
  class NiobiosController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
