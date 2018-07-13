module Private
  module Deposits
    class DashpaysController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
