class SessionsController < ApplicationController
	include ApplicationHelper

	def new
	end


  def create
    user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:auth_token] = user.auth_token
	    flash[:message] = "Welcome"
	    redirect_to :root
	  else
	  	flash[:error] = ["Invalid email or Password"]
	      redirect_to login_sessions_path
	  end
   end
 

  def destroy
    session.delete(:auth_token)
    redirect_to "/"
  end
end
