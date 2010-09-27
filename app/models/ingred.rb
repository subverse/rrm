class Ingred < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :ingredtype_id
  belongs_to :ingredtype


 # Alphabetische Listen anzeigen
  def self.alpha(arg)
    find(:all, :conditions => ["name LIKE ?", arg+"%"], :order => "name ASC")
  end #end alpha


  def is_recipe?
    false
  end


  def self.search(search)
    result1 = find(:all, :conditions => ["name='#{search}'"], :order => "name ASC")
    if result1.length == 0
      result1 = find(:all, :conditions => ["name='#{search.capitalize}'"], :order => "name ASC")
    end
    result2 = find(:all, :conditions => ["name LIKE ?", '#{search}%'], :order => "name ASC")
    if result2.length == 0
      result2 = find(:all, :conditions => ["name LIKE ?", '#{search.capitalize}%'], :order => "name ASC")
    end
    result2 = result2-result1

    result3 = Array.new
    if search.length > 2
      result3 = find(:all, :conditions => ["name LIKE ?", '%'+search+'%'], :order => "name ASC")
      if result3.length == 0
        result3 = find(:all, :conditions => ["name LIKE ?", '%'+search.capitalize+'%'], :order => "name ASC")
      end
      result3 = result3 - result1
      result3 = result3 - result2
    end

    return [result1, result2, result3]
  end #end search(arg)


  def ingredtype_name
    Ingredtype.find(self[:ingredtype_id]).name
  end


  def self.find_all
    find(:all, :order => "name asc")
  end


  def find_recipes(ingred_id)
    result = Array.new
    recipes = Recipe.find(:all)
    recipes.each do |recipe|
      if recipe.has_ingred?(ingred_id)
        result.push(recipe)
      end
    end
    return result
  end #end find_recipes

end #end Ingred
