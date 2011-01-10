class AddInfoToUnit < ActiveRecord::Migration
  def self.up
    add_column :units, :info, :string
  end

  def self.down
      remove_column :units, :info
  end
end
