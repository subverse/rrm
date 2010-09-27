class AddProcessToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :process, :string
  end

  def self.down
    remove_column :recipes, :process
  end
end
