module Private
  class AssetsController < BaseController
    skip_before_action :auth_member!, only: [:index]

    def index
      @cny_assets  = Currency.assets('cny')
      @btc_proof   = Proof.current :btc
      @iop_proof   = Proof.current :iop
      @nbr_proof   = Proof.current :nbr
      @cny_proof   = Proof.current :cny

      if current_user
        @btc_account = current_user.accounts.with_currency(:btc).first
        @iop_account = current_user.accounts.with_currency(:iop).first
        @nbr_account = current_user.accounts.with_currency(:nbr).first
        @cny_account = current_user.accounts.with_currency(:cny).first
      end
    end

    def partial_tree
      account    = current_user.accounts.with_currency(params[:id]).first
      @timestamp = Proof.with_currency(params[:id]).last.timestamp
      @json      = account.partial_tree.to_json.html_safe
      respond_to do |format|
        format.js
      end
    end

  end
end
