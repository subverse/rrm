class AddIngredIdToIngredients < ActiveRecord::Migration
  def self.up
    add_column :ingredients, :ingred_id, :integer
  end

  def self.down
    remove_column :ingredients, :ingred_id
  end
end
