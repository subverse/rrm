class IngredientsController < ApplicationController
  # GET /ingredients
  # GET /ingredients.xml

  layout 'application'

  before_filter :login_required

  def index
    @ingredients = Ingredient.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingredients }
    end
  end

  # GET /ingredients/1
  # GET /ingredients/1.xml
  def show
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredient }
    end
  end
  
  
  # GET /ingredients/new
  # GET /ingredients/new.xml
  def new
    @ingredient = Ingredient.new
    @ingredient.recipe_id = params[:id]
    @ingredient.unit_id = 5
    
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @ingredient }
    end
  end

  # GET /ingredients/1/edit
  def edit
    @ingredient = Ingredient.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @ingredient }
    end #respond_to
  end #edit

  # POST /ingredients
  # POST /ingredients.xml
  def create
    @ingredient = Ingredient.new(params[:ingredient])
    recipe = Recipe.find(@ingredient.recipe_id)
    
    respond_to do |format|
      if @ingredient.save
        flash[:notice] = 'Ingredient was successfully created.'
        format.html { redirect_to(recipe) }
        format.xml  { render :xml => @ingredient, :status => :created, :location => @ingredient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingredients/1
  # PUT /ingredients/1.xml
  def update
    @ingredient = Ingredient.find(params[:id])
    recipe = Recipe.find(@ingredient.recipe_id)

    @ingredients = recipe.ingredients
    @ingred_list = recipe.get_ingreds
    
    respond_to do |format|
      if @ingredient.update_attributes(params[:ingredient])
        flash[:notice] = 'Ingredient was successfully updated.'
        format.html {redirect_to recipe}
        #format.html { redirect_to(recipe) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingredient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.xml
  def destroy
    @ingredient = Ingredient.find(params[:id])
    recipe = Recipe.find(@ingredient.recipe_id)
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to(recipe) }
      format.xml  { head :ok }
    end
  end
end
