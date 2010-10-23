class AddToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :incl_prod, :integer, :default => 0
  end

  def self.down
    remove_column :lists, :incl_prod
  end
end
