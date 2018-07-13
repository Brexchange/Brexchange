module Private
  module Deposits
    class FermatsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
