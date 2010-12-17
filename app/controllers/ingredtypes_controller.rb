class IngredtypesController < ApplicationController

  layout 'application'

  before_filter :login_required, :except => [:index, :show]

  # GET /ingredtypes
  # GET /ingredtypes.xml
  def index
    @ingredtypes = Ingredtype.find_all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingredtypes }
    end
  end
  
  
  # GET /ingredtypes/1
  # GET /ingredtypes/1.xml
  def show
    @ingredtype = Ingredtype.find(params[:id])
    @ingreds = @ingredtype.ingreds
    @recipes = @ingredtype.recipes

    respond_to do |format|
      format.html #show.html.erb
      format.xml  { render :xml => @ingredtype }
    end
  end #end show
  

  # GET /ingredtypes/1
  # GET /ingredtypes/1.xml
  def show_remote
    @ingredtype = Ingredtype.find(params[:id])
    @ingreds = @ingredtype.ingreds
    @recipes = @ingredtype.recipes

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @ingredtype }
    end
  end #end show_remote
 
  
  
  # GET /ingredtypes/new
  # GET /ingredtypes/new.xml
  def new
    @ingredtype = Ingredtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ingredtype }
    end
  end

  # GET /ingredtypes/1/edit
  def edit
    @ingredtype = Ingredtype.find(params[:id])
  end

  # POST /ingredtypes
  # POST /ingredtypes.xml
  def create
    @ingredtype = Ingredtype.new(params[:ingredtype])

    respond_to do |format|
      if @ingredtype.save
        flash[:notice] = 'Ingredtype was successfully created.'
        format.html { redirect_to(@ingredtype) }
        format.xml  { render :xml => @ingredtype, :status => :created, :location => @ingredtype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingredtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingredtypes/1
  # PUT /ingredtypes/1.xml
  def update
    @ingredtype = Ingredtype.find(params[:id])

    respond_to do |format|
      if @ingredtype.update_attributes(params[:ingredtype])
        flash[:notice] = 'Ingredtype was successfully updated.'
        format.html { redirect_to(@ingredtype) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingredtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredtypes/1
  # DELETE /ingredtypes/1.xml
  def destroy
    @ingredtype = Ingredtype.find(params[:id])
    @ingredtype.destroy

    respond_to do |format|
      format.html { redirect_to(ingredtypes_url) }
      format.xml  { head :ok }
    end
  end
end
