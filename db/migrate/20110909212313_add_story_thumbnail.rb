class AddStoryThumbnail < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.string :picture_file_name 
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
    end
  end
end
