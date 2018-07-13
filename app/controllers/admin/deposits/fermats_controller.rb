module Admin
  module Deposits
    class FermatsController < ::Admin::Deposits::BaseController
      load_and_authorize_resource :class => '::Deposits::Satoshi'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24 * 365)
        @fermats = @fermats.includes(:member).
          where('created_at > ?', start_at).
          order('id DESC').page(params[:page]).per(20)
      end

      def update
        @satoshi.accept! if @satoshi.may_accept?
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
