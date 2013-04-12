class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
    	t.integer :name
    	t.integer :xp
    	t.integer :health
      t.timestamps
    end
  end
end
