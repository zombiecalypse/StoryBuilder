class AddAvatarToUser < ActiveRecord::Migration
  def change
    add_column :characters, :avatar_file_name, :string
    add_column :characters, :avatar_content_type, :string
    add_column :characters, :avatar_file_size, :integer
    add_column :characters, :avatar_updated_at, :datetime
  end
end
