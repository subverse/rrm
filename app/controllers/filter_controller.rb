class FilterController < ApplicationController

  def search_ingreds
    @search = params[:ingred_search_field].strip

    @ingreds  = Array.new
    @ingreds_rest = Array.new
    @ingreds_contains = Array.new

    result = Ingred.search(@search)
#    if result != nil
      @ingreds = result.at(0) 
      @ingredss_rest = result.at(1)
      @ingreds_contains = result.at(2)
#    end

    render :layout => false
  end #end search_ingreds
  
 
  def search_ingreds_bak
    @search = params[:ingred_search_field].strip

    @ingreds  = Array.new
    @ingreds_rest = Array.new
    @ingreds_contains = Array.new

    result = Ingred.search(@search)
    if result != nil
      @ingreds = result.at(0) 
      @ingreds_rest = result.at(1)
      @ingreds_contains = result.at(2)
    end

    render :layout => false
  end #end search_ingreds
  
  

  def search_recipes
    @search = params[:search_field].strip

    @recipes  = Array.new
    @recipes_rest = Array.new

    result = Recipe.search(@search)
    @recipes = result.at(0)
    @recipes_rest = result.at(1)
    @recipes_contains = result.at(2)

    render :layout => false
  end #end search


  def search_recipes_1
    @search = params[:search_field].strip

    @recipes  = Array.new
    @recipes_rest = Array.new

    result = Recipe.search(@search)
    @recipes = result.at(0)
    @recipes_rest = result.at(1)
    @recipes_contains = result.at(2)

    render :layout => false
  end #end search_recipes_1


  def search_recipes_detailed
    @station = Station.find(params[:station][:station_id]).name
    @station_check = params[:station_check][:checked]
    @source = Source.find(params[:source][:source_id]).name
    @source_check = params[:source_check][:checked]
    @ingred = Ingred.find(params[:ingred][:ingred_id]).name
    @ingred_check = params[:ingred_check][:checked]
    @ingred_1 = Ingred.find(params[:ingred_1][:ingred_id_1]).name
    @ingred_check_1 = params[:ingred_check_1][:checked]
    @ingred_2 = Ingred.find(params[:ingred_2][:ingred_id_2]).name
    @ingred_check_2 = params[:ingred_check_2][:checked]

    @recipes = Recipe.search_detailed(params[:station][:station_id], params[:station_check][:checked],
                                      params[:source][:source_id], params[:source_check][:checked],
                                      params[:ingred][:ingred_id], params[:ingred_check][:checked],
                                      params[:ingred_1][:ingred_id_1], params[:ingred_check_1][:checked],
                                      params[:ingred_2][:ingred_id_2], params[:ingred_check_2][:checked])
    render :layout => 'false'
  end #end search_books_detailed

end
