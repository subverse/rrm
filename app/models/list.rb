class List < ActiveRecord::Base
  validates_presence_of :owner
  validates_presence_of :recipe_id


  def self.find_by_owner(owner, recipe_id)
    self.find(:first, :conditions => "id='#{recipe_id}' and owner='#{owner}'")
  end


  def self.find_all_by_owner(owner)
    self.find(:all, :conditions => "owner='#{owner}'")
  end


  def self.recipes(owner)
    entries = self.find(:all, :conditions => "owner='#{owner}'")
    erg = Array.new
    entries.each do |entry|
      recipe = Recipe.find(entry.recipe_id)
      if not erg.include?(recipe)
        erg.push(recipe)
      end
    end
    erg
  end #end self.recipes(owner)

end #end class List
