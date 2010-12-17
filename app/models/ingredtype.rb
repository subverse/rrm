class Ingredtype < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :ingreds

  def self.find_all
    find(:all, :order => "name asc")
  end

  def recipes
    ingreds_list = self.ingreds
    recipes = Array.new
    length = ingreds.length
    if length > 0
      ingreds_list.each do |ingred|
        recipes = recipes + ingred.find_recipes
      end
    end
    return recipes
  end

end #end Ingredtype
