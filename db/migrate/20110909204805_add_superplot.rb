class AddSuperplot < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.references :superplot
    end
  end
end
