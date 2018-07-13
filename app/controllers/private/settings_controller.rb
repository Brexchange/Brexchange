module Private
  class SettingsController < BaseController
    def index
      @announcement = Announcement.latest
      unless current_user.activated?
        flash.now[:info] = t('.activated')
      end
    end
  end
end

