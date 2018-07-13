module Admin
  module Withdraws
    class DashpaysController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Dashpay'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_dashpays = @dashpays.with_aasm_state(:accepted).order("id DESC")
        @all_dashpays = @dashpays.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @dashpay.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @dashpay.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
