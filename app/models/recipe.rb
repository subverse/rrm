class Recipe < ActiveRecord::Base
#  (no) validates_uniqueness_of :name (mehre Rezepte mit gleichem Namen)
  validates_presence_of :name
  validates_presence_of :station_id
  belongs_to :station
  belongs_to :source
  has_many :ingredients
  
  # will_paginate: max number of page items
  def self.per_page
    12
  end
  
  

  # Alphabetische Listen Anzeigen
  def self.alpha(arg)
    find(:all, :conditions => ["name LIKE ?", arg+"%"], :order => "name ASC")
  end #end alpha

 
  def is_recipe?
    true
  end


  def self.ingreds_max_length
    50
  end


  def self.get_by_station(station)
    find(:all, :conditions => ["station_id='#{station.id}'"], :order => "name ASC")
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



  def self.search_detailed(station = 0, station_check = 0,
                           source = 0, source_check = 0,
                           ingred = 0, ingred_check = 0,
                           ingred_1 = 0, ingred_check_1 = 0,
                           ingred_2 = 0, ingred_check_2 = 0)

    conditions = ""
#    conditions += "station_id='#{station}'" if station_check.to_i == 1
    if station_check.to_i == 1
      conditions += " AND " if conditions.length > 0
      conditions += "station_id='#{station}'"
    end
    if source_check.to_i == 1
      conditions += " AND " if conditions.length > 0
      conditions += "source_id='#{source}'"
    end

    result = Array.new
    if conditions != ""
      result = find(:all, :conditions => ["#{conditions}"])
    end

    if ingred_check.to_i == 1

      recipes = Array.new
      result.each do |recipe|
        if recipe.has_ingred?(ingred.to_i)
          recipes.push(recipe)
        end
      end

#      result = recipes
    end


    if ingred_check_1.to_i == 1

      recipes_1 = Array.new
      result.each do |recipe|
        if recipe.has_ingred?(ingred_1.to_i)
          recipes_1.push(recipe)
        end
      end

#      result = recipes
    end


    if ingred_check_2.to_i == 1

      recipes_2 = Array.new
      result.each do |recipe|
        if recipe.has_ingred?(ingred_2.to_i)
          recipes_2.push(recipe)
        end
      end

#      result = recipes
    end

    # all checked
    if ingred_check.to_i == 1 and ingred_check_1.to_i == 1 and ingred_check_2.to_i == 1
      result = recipes & recipes_1 & recipes_2
    end

    # ingred checked
    if ingred_check.to_i == 1 and ingred_check_1.to_i != 1 and  ingred_check_2.to_i != 1
      result = recipes
    end

    #  ingred_1 checked
    if ingred_check.to_i != 1 and ingred_check_1.to_i == 1 and  ingred_check_2.to_i != 1
      result = recipes_1
    end

    # ingred_2 checked
    if ingred_check.to_i != 1 and ingred_check_1.to_i != 1 and  ingred_check_2.to_i == 1
      result = recipes_2
    end

    # ingred AND ingred_1 checked
    if ingred_check.to_i == 1 and ingred_check_1.to_i == 1 and  ingred_check_2.to_i != 1
      result = recipes & recipes_1
    end

    # ingred AND ingred_2 checked
    if ingred_check.to_i == 1 and ingred_check_1.to_i != 1 and  ingred_check_2.to_i == 1
      result = recipes & recipes_2
    end

    # ingred_1 AND ingred_2 checked
    if ingred_check.to_i != 1 and ingred_check_1.to_i == 1 and  ingred_check_2.to_i == 1
      result = recipes_1 & recipes_2
    end

    return result
  end #end self.search_detailed



  def sanitize_ingred_list
    list = get_ingreds_int
   old_list = self.get_ingreds_int
   new_list = old_list.delete_if{|item|item.amount.to_f == 0 }
   empty_ingred_list
   self.save
   add_ingred_list(new_list)
   self.save
  end #end sanitize_ingred_list


  def empty_ingred_list
    length = self[:length]-1
    if length > 0
      for i in 1..length
        self[:"ingred#{i}"] = nil
        self[:"amount#{i}"] = nil
        self[:"unit#{i}"] = nil
      end
      self[:length] = 0
    end
    self.save
  end #end self.empty_ingred_list


  def add_ingred_list(new_ingred_list)
    length = new_ingred_list.length
    for i in 1..length
      self[:"ingred#{i}"] = new_ingred_list.at(i-1).ingred
      self[:"amount#{i}"] = new_ingred_list.at(i-1).amount
      self[:"unit#{i}"] = new_ingred_list.at(i-1).unit
      self[:length] = i+1
    end
    self.save
  end #end self.add_ingreds_list


  def has_ingred?(ingred_id)
    result = false
    if length > 0
      for i in 1..self[:length]
        if self[:"ingred#{i}"] == ingred_id
          result = true
          break
        end
      end
    end
    return result
  end #end has_ingred


  def station_name
    Station.find(self[:station_id]).name
  end


  def source_name
    Source.find(self[:source_id]).name
  end


  def get_ingreds
    length = self[:length]-1
    ingred_list = Array.new
    if length > 0
      for i in 1..length
        item = ListItem.new(self[:"ingred#{i}"], self[:"amount#{i}"], self[:"unit#{i}"], self[:id])
        ingred_list.push(item)
      end
    end
    return ingred_list
  end #end get_ingreds


  def get_ingreds_int
    length = self[:length]-1
    ingred_list = Array.new
    if length > 0
      for i in 1..length
        item = ListItem_int.new(self[:"ingred#{i}"], self[:"amount#{i}"], self[:"unit#{i}"])
        ingred_list.push(item)
      end
    end
    return ingred_list
  end #end get_ingreds_int


  def self.find_all
    find(:all, :order => "name asc")
  end

  class ListItem

    def initialize(ingred, amount, unit, id)
      @arr = Array.new
      if ingred!=nil
        @arr.push(Ingred.find(ingred).name)
        @arr.push(amount)
        @arr.push(Unit.find(unit).name)
        @arr.push(Ingred.find(ingred).id)
        @arr.push(Ingred.find(ingred))
        @arr.push(unit)
      end
    end

    def ingred
      @arr.at(0)
    end

    def amount
      if (@arr.at(1).to_f / @arr.at(1).to_i) != 1
        @arr.at(1).to_f
      else
        @arr.at(1).to_i
      end
    end

    def amount=(new_amount)
      @arr[1] = new_amount.to_f
    end

    def unit
      @arr.at(2)
    end

    def id
      @arr.at(3)
    end

    def ingred_obj
      @arr.at(4)
    end

    def unit_id
      @arr.at(5)
    end

  end #end ListItem


  class ListItem_int

    def initialize(ingred, amount, unit)
      @arr = Array.new
      @arr.push(ingred)
      @arr.push(amount)
      @arr.push(unit)
    end

    def ingred
      @arr.at(0)
    end

    def amount
      @arr.at(1)
    end

    def unit
      @arr.at(2)
    end

  end #end ListItem_int

end #end Recipe
