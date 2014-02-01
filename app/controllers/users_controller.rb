class UsersController < ApplicationController
	include ApplicationHelper



	def new
		@user = User.new
	end


	def create
		user = User.create(params[:user])
		if user.id
			session[:auth_token] = user.auth_token
			flash[:message] = "Welcome!"
			redirect_to "/"
		else
			flash[:error] = user.errors.full_messages
			@user = User.new
			render :new
		end
	end

end