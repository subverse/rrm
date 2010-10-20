class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string  :owner,     :limit => 40 
      t.integer :recipe_id, :limit => 10 
      t.integer :shop_it,   :limit => 1 
      t.integer :print_it,  :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
