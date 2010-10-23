class AddMultiplierToLists < ActiveRecord::Migration

  def self.up
    add_column :lists, :multiplier, :float, :default => 1.0
  end

  def self.down
    drop_column :lists, :multipier
  end

end # class AddMultiplierToLists < ActiveRecord::Migration
