class WelcomeController < ApplicationController
  layout 'landing'

  def index
    @announcement = Announcement.public_latest
  end
end
