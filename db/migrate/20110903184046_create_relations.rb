class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :character
      t.references :towards
      t.string :short
      t.text :description

      t.timestamps
    end
    add_index :relations, :character_id
    add_index :relations, :towards_id
  end
end
