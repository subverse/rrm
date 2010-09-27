class Station < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :recipes

  def self.find_all
    find(:all, :order => "name asc")
  end

end #end Station
