class RecipesController < ApplicationController

  layout 'application', :except => :print

  before_filter :login_required, :except => [:index, :show, :show_alt,
                                             :print, :search, :multiply,
                                             :alpha]

  # Alphabetische Listen anzeigen
  def alpha
    @search = params[:a]
    @recipes = Recipe.alpha(@search)

    render :layout => false
  end #end alpha


  # GET /recipes
  # GET /recipes.xml
  def index
    @recipes_length = Recipe.count
    @recipes = Recipe.find(:all, :order => "id DESC")
    @recipes = @recipes[0..9]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end


  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
    @station = Station.find(@recipe.station_id).name
    @ingred_list = @recipe.get_ingreds
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end #end show


  # GET /recipes/1
  # GET /recipes/1.xml
  def multiply
    @recipe = Recipe.find(params[:id])
    @factor = params[:input].to_f
#   @station = Station.find(@recipe.station_id).name
    @ingred_list = @recipe.get_ingreds

    @ingred_list.each do |ingred|
      ingred.amount=(ingred.amount * @factor).to_f
    end

    render :partial => "ingreds"
  end #end show


  # GET /recipes/1
  # GET /recipes/1.xml
  def print
    @recipe = Recipe.find(params[:id])
    @station = Station.find(@recipe.station_id).name
    @ingred_list = @recipe.get_ingreds
    respond_to do |format|
      format.html { render :layout => 'recipe'}
      format.xml  { render :xml => @recipe }
    end
  end #end print

  
  def cancel
    render :update do |page|
      page.replace_html 'erg', ' '
    end
  end

  
  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end


  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        flash[:notice] = 'Recipe was successfully created.'
        format.html { redirect_to(@recipe) }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end


  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @ingreds = Ingred.find(:all)
    @ingred_list = @recipe.get_ingreds
    @ingred_list_int = @recipe.get_ingreds_int
  end


  # PUT /recipes/1
  # PUT /recipes/1.xml update
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        recipe = Recipe.find(params[:id])
        recipe.sanitize_ingred_list
        @recipe.save
        flash[:notice] = 'Recipe was successfully updated.'
        format.html { redirect_to(@recipe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end
  


  def add_process
    @recipe = Recipe.find(params[:id])
    
    @station = Station.find(@recipe.station_id).name
    @ingred_list = @recipe.get_ingreds
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end
  #end add_process


  def save_process
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        flash[:notice] = 'process was successfully saved.'
        format.html { redirect_to(@recipe) }
        format.xml  { head :ok }
      else
        flash[:notice] = 'try again.'
        format.html { render :action => "add_process" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end #end save_process


  def add_ingred
    @recipe = Recipe.find(params[:id])

    if @recipe.length >= Recipe.ingreds_max_length

      respond_to do |format|
        flash[:notice] = 'ingreds full'
        format.html { redirect_to(@recipe) }
#        format.html { render :action => "add_ingred" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end

    else
      render :layout => false
    end
      
  end #end add_ingred
      


  def save_ingred
    @recipe = Recipe.find(params[:id])
    @recipe.length = @recipe.length + 1

    respond_to do |format|
      if  @recipe.length <= Recipe.ingreds_max_length && @recipe.update_attributes(params[:recipe])
        flash[:notice] = 'ingred was successfully saved.'
#        format.html { redirect_to(@recipe) }
        format.html { render :controller => 'recipes', :action => 'add_ingred' }
        format.xml  { head :ok }
      else
        format.html { redirect_to(@recipe) }
#        format.html { render :action => "add_ingred" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end #end save_ingred


end #end recipes_controller
