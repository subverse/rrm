class Ingredient < ActiveRecord::Base
  validates_presence_of :recipe_id
  validates_presence_of :amount
  validates_presence_of :unit_id
  
  belongs_to :recipe

  def amount
    amount = self[:amount]
    if (amount / amount.to_i) == 1
      return amount.to_i
    else
      return amount
    end
    result
  end #amount
  
  def name
    Ingred.find(self[:ingred_id]).name
  end
  
  def ingred
    Ingred.find(self[:ingred_id])
  end
  
  def unit
    Unit.find(self[:unit_id]).name
  end
 
end
