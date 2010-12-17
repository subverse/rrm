class IngredsController < ApplicationController

  layout 'application'

  before_filter :login_required, :except => [:index, :show, :alpha]

  # Alphabetische Listen anzeigen
  def alpha
    @search = params[:a]
    @ingreds = Ingred.alpha(@search)
    render :layout => false
  end #end alpha

  # GET /ingreds
  # GET /ingreds.xml
  def index
    @ingreds_length = Ingred.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingreds }
    end
  end

  
  # GET /ingreds/1
  # GET /ingreds/1.xml
  def show_remote
    @ingred = Ingred.find(params[:id])
    @recipes = @ingred.find_recipes
        
    respond_to do |format|
      format.html { render :layout => false}# show_remote.html.erb
      format.xml  { render :xml => @ingred }
    end
  end

  
  
  # GET /ingreds/1
  # GET /ingreds/1.xml
  def show
    @ingred = Ingred.find(params[:id])
    @recipes = @ingred.find_recipes

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingred }
    end
  end


  # GET /ingreds/new
  # GET /ingreds/new.xml
  def new
    @ingred = Ingred.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ingred }
    end
  end


  # GET /ingreds/1/edit
  def edit
    @ingred = Ingred.find(params[:id])
  end


  # POST /ingreds
  # POST /ingreds.xml
  def create
    @ingred = Ingred.new(params[:ingred])

    respond_to do |format|
      if @ingred.save
        flash[:notice] = 'Ingred was successfully created.'
        format.html { redirect_to(@ingred) }
        format.xml  { render :xml => @ingred, :status => :created, :location => @ingred }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingred.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingreds/1
  # PUT /ingreds/1.xml
  def update
    @ingred = Ingred.find(params[:id])

    respond_to do |format|
      if @ingred.update_attributes(params[:ingred])
        flash[:notice] = 'Ingred was successfully updated.'
        format.html { redirect_to(@ingred) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingred.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingreds/1
  # DELETE /ingreds/1.xml
  def destroy
    @ingred = Ingred.find(params[:id])
    @ingred.destroy

    respond_to do |format|
      format.html { redirect_to(ingreds_url) }
      format.xml  { head :ok }
    end
  end

end #end Ingredscontroller
