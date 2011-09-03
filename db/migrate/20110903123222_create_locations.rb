class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.references :image

      t.timestamps
    end
    add_index :locations, :image_id
  end
end
