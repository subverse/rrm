require 'classes'

class List < ActiveRecord::Base

  include Classes

  validates_presence_of :owner
  validates_presence_of :recipe_id


  def self.find_by_owner(owner, recipe_id)
    self.find(:first, :conditions => "id='#{recipe_id}' and owner='#{owner}'")
  end


  def self.find_all_by_owner(owner)
    self.find(:all, :conditions => "owner='#{owner}'")
  end


  def self.find_recipes_by_owner(owner)
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


  def self.get_all_ingreds_list(recipes)
    all_ingreds_list = Array.new
    recipes.each do |recipe|
      ingred_list = recipe.get_ingreds
      ingred_list.each do |ingred|
          new_item = Ingred_data.new(ingred.id, 0, ingred.unit_id)
          new_item.add(ingred.amount, ingred.unit_id)
          all_ingreds_list.push(new_item)
      end
    end
    return all_ingreds_list
  end #end self.get_all_ingreds_list


  def self.get_shoppinglist(recipes)
    shoppinglist = Array.new
    all_ingreds_list = get_all_ingreds_list( recipes )
    locked = false
    all_ingreds_list.each do |item|
      if locked
        index = includes_ingred?(shoppinglist, item.ingred_id, item.unit_id)
        if index == -1
          shoppinglist.push(item)
        else
          shoppinglist.at(index).add(item.amount, item.unit_id)
        end
      else #if locked
        shoppinglist.push(item)
        locked = true
      end
    end
    sorted_shoppinglist = sort_ingred_list_by_ingredtype(shoppinglist)
    sorted_shoppinglist = sort_ingred_list(sorted_shoppinglist)
    return sorted_shoppinglist
  end #end get_shoppinglist


  private


  def self.sort_ingred_list_by_ingredtype(list)
    arr = Array.new
    item = list.shift
    arr.push(item)
    while not list.empty?
      item = list.shift
      index = get_index_of_ingredtype(arr, item.ingredtype_id)
      if index == -1
        arr.push(item)
      else
        arr.insert(index, item)
      end
    end
    return arr.compact
  end #end sort_ingred_list_by_ingredtype


  def self.get_index_of_ingredtype(list, ingredtype_id)
    index = -1
    if list.length > 0
      i = 0
      list.each do |item|
        if item.ingredtype_id == ingredtype_id
          index = i
        end
        i += 1
      end
    end
    return index
  end #end get_index_of_ingredtype


  def self.sort_ingred_list(list)
    arr = Array.new
    item = list.shift
    arr.push(item)
    while not list.empty?
      item = list.shift
      index = get_index(arr, item.ingred_id)
      if index == -1
        arr.push(item)
      else
        arr.insert(index, item)
      end
    end
    return arr.compact
  end #end sort_ingred_list


  def self.get_index(list, ingred_id)
    index = -1
    if list.length > 0
      i = 0
      list.each do |item|
        if item.ingred_id == ingred_id
          index = i
        end
        i += 1
      end
    end
    return index
  end #end get_index



  def self.includes_ingred?(shoppinglist, ingred_id, unit_id)
    index = -1
    if shoppinglist.length > 0
      i = 0
      shoppinglist.each do |item|
        if item.ingred_id == ingred_id and item.unit_id == unit_id
          index = i
        end
        i += 1
      end
    end
    return index
  end #end includes_ingred?

end #end class List
