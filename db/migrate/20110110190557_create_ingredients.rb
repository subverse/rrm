class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.float :amount
      t.integer :unit_id
      t.string :info

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
