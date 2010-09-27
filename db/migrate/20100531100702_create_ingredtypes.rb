class CreateIngredtypes < ActiveRecord::Migration
  def self.up
    create_table :ingredtypes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredtypes
  end
end
