class AddLengthToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :length, :integer, :default => 0
  end

  def self.down
    remove_column :recipes, :length
  end
end
