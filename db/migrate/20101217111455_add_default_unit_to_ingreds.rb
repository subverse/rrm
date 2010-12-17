class AddDefaultUnitToIngreds < ActiveRecord::Migration
  def self.up
    add_column :ingreds, :unit_id, :integer, :default => 5
  end

  def self.down
    remove_column :ingreds, :unit_id
  end
end
