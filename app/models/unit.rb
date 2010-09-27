class Unit < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  def self.find_all
    find(:all, :order => "name asc")
  end

end #end Unit
