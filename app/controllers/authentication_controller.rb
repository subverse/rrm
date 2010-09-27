require 'crypt'

class AuthenticationController < ApplicationController

  layout 'application'


  def login
    reset_session
    session[:user_id] = nil
  end


  def check
    @user = User.authenticate(params[:name], params[:pw])
    if @user != nil
      session[:user_id] = @user.id
      if @user.level == 0
        session[:admin] = true
      end
      flash[:notice] = "#{@user.name} wurde erfolgreich angemeldet"
      redirect_to :controller => "rrm", :action => "index"
    else
      reset_session
      session[:user_id] = nil
      flash[:notice] = "Fehler bei der Anmeldung"
      redirect_to :controller => "authentication", :action => "login"
    end
  end #end check

  def logout
    reset_session
    session[:user_id] = nil
    flash[:notice] = "Sie wurden abgemeldet"
    redirect_to :controller => "rrm", :action => "index"
  end

end


