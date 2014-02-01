
class FreebasesController < ApplicationController

	 include ApplicationHelper

	 

	def index
		 current_user
				@results	= query_search(params[:query])
	end

	def show

		@resource

	end
end
