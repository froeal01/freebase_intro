require 'spec_helper'

describe FreebasesController do
	subject {page}

	describe "#index" do 

		it "renders the correct template" do 
			get :index
			response.should render_template :index
		end

		it "includes the search field for freebase" do 
			get :index
			response.should have_selector("label", text: "search for")
		end
	end
end