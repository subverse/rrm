class ListsController < ApplicationController
  
  def clearList
    owner = current_user.login
    @list = List.clear(owner)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list }
    end
  end #end clearList

  
  # GET /recipes/1
  # GET /recipes/1.xml
  def print
    owner = current_user.login
    @lists = List.find_all_by_owner(owner)
    @recipes = Array.new
    @lists.each do |item|
      @recipes.push(Recipe.find(item.recipe_id))
    end

    respond_to do |format|
      format.html { render :layout => 'recipe'}
      format.xml  { render :xml => @lists }
    end
  end #end print
  
    
  def shoppinglist
    owner = current_user.login
    @lists = List.find_all_by_owner(owner)
    @shoppinglist = Array.new
    @recipes = Array.new
    
    @lists.each do |item|
      if item.shop_it == 1
        @shoppinglist.push(item)
        @recipes.push(Recipe.find_by_id(item.recipe_id))
      end
    end
    
    @shoppinglistItems = Array.new
    @shoppinglistItems = List.get_shoppinglist(@recipes)
        
    respond_to do |format|
      format.html #shoppinglist.html.erb
      format.xml  { render :xml => @lists }
    end
  end #end shoppinglist
 
  
  def print_shoppinglist
    owner = current_user.login
    @lists = List.find_all_by_owner(owner)
    @recipes = Array.new
    @lists.each do |item|
      if item.shop_it == 1
        @recipes.push(Recipe.find(item.recipe_id))
      end
    end

    @shoppinglist = List.get_shoppinglist(@recipes)

    respond_to do |format|
      format.html { render :layout => 'recipe'}
      format.xml  { render :xml => @lists }
    end
  end #end print_shoppinglist


  def print_ingreds
    owner = current_user.login
    @lists = List.find_all_by_owner(owner)
    @recipes = Array.new
    @lists.each do |item|
      @recipes.push(Recipe.find(item.recipe_id))
    end

    respond_to do |format|
      format.html { render :layout => 'recipe'}
      format.xml  { render :xml => @lists }
    end
  end #end print_ingreds


  # GET /lists
  # GET /lists.xml
  def index
    owner = current_user.login
    @lists = List.find_all_by_owner(owner)
    @recipes = List.find_recipes_by_owner(owner)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lists }
    end
  end #end index
  
  
  # GET /lists/1
  # GET /lists/1.xml
  def show
    listItem = List.find(params[:id])

    redirect_to :controller => :recipes, :action => :show, :id => listItem.recipe_id
  end#end show
  
   
  # GET /lists/new
  # GET /lists/new.xml
  def new
    @list = List.new
    @list.recipe_id = params[:recipe_id]
    @list.owner = current_user.login
    @recipe = Recipe.find(@list.recipe_id)
        
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @list }
    end
  end #end new
  
  
  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
    @recipe_name = Recipe.find(@list.recipe_id).name

    render :layout => false
  end #end edit
  

  # POST /lists
  # POST /lists.xml
  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to( :controller => "recipes" ,:action => "show", :id => @list.recipe_id, :notice => 'successful') }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
      else
        format.html { redirect_to( :controller => "recipes" ,:action => "show", :id => @list.recipe_id, :notice => 'error while saving') }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.xml
  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to( :action => "index", :notice => 'successful') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.xml
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(lists_url) }
      format.xml  { head :ok }
    end
  end
end
