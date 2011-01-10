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
  
end
