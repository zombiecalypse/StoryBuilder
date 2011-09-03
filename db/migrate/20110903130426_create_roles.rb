class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :character
      t.references :story
      t.string :role
      t.text :description

      t.timestamps
    end
    add_index :roles, :character_id
    add_index :roles, :story_id
  end
end
