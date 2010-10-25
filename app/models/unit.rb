class Unit < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name


  def self.find_all
    find(:all, :order => "name asc")
  end


  def self.convert_weights(amount, unit_name)
    weights_conversion = Hash.[]("g"    => 1, "kg"   => 1000,
                                 "Msp." => 1, "Pr."  => 5,
                                 "TL"   => 8, "EL"   => 20).freeze
    factor = weights_conversion[unit_name]
    new_amount = amount * factor
    base_unit = "g"
    if new_amount > 1
 #     new_amount = new_amount / 1000.0
 #     base_unit = "kg"
    end
    base_unit_id = self.find_by_name(base_unit).id
    return [new_amount, base_unit_id]
  end #end convert_weights


  def self.convert_volumes(amount, unit_name)
    volumes_conversion = Hash.[]("ml" => 1,  "Liter" => 1000,
                                 "cl" => 10, "dl"    => 100).freeze
    factor = volumes_conversion[unit_name]
    new_amount = amount * factor
    base_unit = "ml"
    if new_amount > 1
#      new_amount = new_amount / 1000.0
#      base_unit = "Liter"
    end
    base_unit_id = self.find_by_name(base_unit).id
    return [new_amount, base_unit_id]
  end #end convert_volumes


end #end Unit
