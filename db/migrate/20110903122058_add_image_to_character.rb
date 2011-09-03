class AddImageToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :image, :reference
  end
end
