module Admin
  module Withdraws
    class FermatsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Fermat'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_fermats = @fermats.with_aasm_state(:accepted).order("id DESC")
        @all_fermats = @fermats.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @fermat.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @fermat.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
