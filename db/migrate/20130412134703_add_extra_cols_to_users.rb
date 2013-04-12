class AddExtraColsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :strength, :integer, :default=>5
  	add_column :users, :aim, :integer, :default=>5
  	add_column :users, :xp, :integer, :default=>0
  end
end
