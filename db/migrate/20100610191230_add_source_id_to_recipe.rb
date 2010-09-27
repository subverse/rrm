class AddSourceIdToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :source_id, :integer
  end

  def self.down
    remove_column :recipes, :source_id
  end
end
