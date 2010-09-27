class AddIngredsToRecipes < ActiveRecord::Migration

  def self.up
    for i in 1..50 do
      add_column :recipes, :"ingred#{i}", :integer
      add_column :recipes, :"amount#{i}", :float
      add_column :recipes, :"unit#{i}", :integer
    end
  end

  def self.down
    for i in 1..50 do
      remove_column :recipes, :"ingred#{i}", :integer
      remove_column :recipes, :"amount#{i}", :float
      remove_column :recipes, :"unit#{i}", :integer
    end
  end

end
