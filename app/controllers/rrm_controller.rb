# -*- coding: utf-8 -*-
class RrmController < ApplicationController

  layout 'application'

  def index
    @recipes_count = Recipe.count
    @stations_count = Station.count
    @ingreds_count = Ingred.count
    @ingredtypes_count = Ingredtype.count
  end

  def download
    send_file "#{RAILS_ROOT}/db/development.sqlite3"
  end

  
  def help
    
  end

  def show

  end
  
end #end controller
