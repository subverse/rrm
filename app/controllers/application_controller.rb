# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'crypt'

class ApplicationController < ActionController::Base

  include AuthenticatedSystem

  #before_filter :authenticate

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def authenticate
    if not user?
      authenticate_or_request_with_http_basic do |user,password|
        if user != "login"
          user = User.authenticate(user, password)
        else
          user = "login" and password == "pw4login:08154711"
        end
      end
    end
  end #end authenticate


  def admin?
    session[:admin] == true
  end

  def user?
    admin? or not session[:user_id] == nil
  end


end #end applicationcontroller
