class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.published.page params[:page]
  end

end
