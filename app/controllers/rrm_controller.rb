# -*- coding: utf-8 -*-
class RrmController < ApplicationController

  layout 'application'

  def index
    @recipes_count = Recipe.count
    @stations_count = Station.count
    @ingreds_count = Ingred.count
    @ingredtypes_count = Ingredtype.count

    @recipes = Recipe.find(:all, :order => "id DESC")
    @recipes = @recipes[0..2]
  end

end
