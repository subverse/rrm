# -*- coding: utf-8 -*-
class RrmController < ApplicationController

  layout 'application'

  def index
    @recipes_count = Recipe.count
    @stations_count = Station.count
    @ingreds_count = Ingred.count
    @ingredtypes_count = Ingredtype.count
  end
  
  def help
    
  end
  
end
