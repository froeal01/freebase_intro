require 'rubygems'
require 'addressable/uri'

module ApplicationHelper

	def current_user
			@current_user ||= User.find_by_auth_token!(session[:auth_token]) if session[:auth_token]
	end



	API_KEY = "AIzaSyBB35jT9xNiPClIOpf2Lo40kqI447b1Jz4"

	def query_search(params)
			url = Addressable::URI.parse('https://www.googleapis.com/freebase/v1/search')
			url.query_values = {
			        'query' => params,
			        'key'=> API_KEY
			}
			response = HTTParty.get(url, :format => :json)
			response['result'].each { |topic|
			  puts topic['name']
			}
	end
end
