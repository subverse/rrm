class StationsController < ApplicationController

  layout 'application', :except => :print

  before_filter :login_required, :except => [:index, :show]

  # GET /stations
  # GET /stations.xml
  def index
    @stations = Station.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stations }
    end
  end
  
  
  # GET /stations/1
  # GET /stations/1.xml
  def show
    @station = Station.find(params[:id])
    @recipes = @station.recipes
    @recipes = Recipe.paginate :page => params[:page],
                               :conditions => ["station_id='#{@station.id}'"],
                               :order => 'name ASC'

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @station }
    end
  end
  
  
  def print
    @station = Station.find(params[:id])
    @recipes = Recipe.get_by_station(@station)
    
    @first = 2
    @second = 31
    @third = 60
    
    @rows = 28
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @lists }
    end
  end #end print

  
  # GET /stations/new
  # GET /stations/new.xml
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @station }
    end
  end
  
  
  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])
  end
  
  
  # POST /stations
  # POST /stations.xml
  def create
    @station = Station.new(params[:station])

    respond_to do |format|
      if @station.save
        flash[:notice] = 'Station was successfully created.'
        format.html { redirect_to(@station) }
        format.xml  { render :xml => @station, :status => :created, :location => @station }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # PUT /stations/1
  # PUT /stations/1.xml
  def update
    @station = Station.find(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        flash[:notice] = 'Station was successfully updated.'
        format.html { redirect_to(@station) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # DELETE /stations/1
  # DELETE /stations/1.xml
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to(stations_url) }
      format.xml  { head :ok }
    end
  end
end
