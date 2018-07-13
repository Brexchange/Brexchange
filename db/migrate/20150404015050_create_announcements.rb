class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :title
      t.text :content
      t.boolean :public
      t.integer :author_id
      t.datetime :publish_at
      
      t.timestamps null: false
    end
  end
end
