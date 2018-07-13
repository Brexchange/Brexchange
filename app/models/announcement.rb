class Announcement < ActiveRecord::Base
  belongs_to :author, class_name: 'Member', foreign_key: 'author_id'

  scope :public, -> { where(public: true) }
  scope :published, -> { where('publish_at < ?', Time.now).order('created_at Desc') }

  def self.latest
    published.first
  end

  def self.public_latest
    public.published.first
  end

end