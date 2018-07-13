module Admin
  class AnnouncementsController < BaseController
    load_and_authorize_resource

    def index
      @announcements = @announcements.order(created_at: :desc).page params[:page]
    end

    def new
    end

    def create
      @announcement.author = current_user
      if @announcement.save
        redirect_to admin_announcements_path
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      if @announcement.update_attributes(announcement_params)
        redirect_to admin_announcements_path
      else
        render :edit
      end
    end

    def destroy
      if @announcement.destroy
        redirect_to admin_announcements_path
      else
        render :edit
      end
    end

    private

    def announcement_params
      params.required(:announcement).permit(:title, :content, :public, :publish_at)
    end

  end
end

