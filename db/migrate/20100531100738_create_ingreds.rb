class CreateIngreds < ActiveRecord::Migration
  def self.up
    create_table :ingreds do |t|
      t.string :name
      t.integer :ingredtype_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ingreds
  end
end
