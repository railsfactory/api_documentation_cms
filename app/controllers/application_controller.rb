class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :default_values
	#before_filter :http_authenticate_links

  def default_values
		@api = ApiList.all
		@api_methods = ApiMethod.all
		@api_method = ApiList.first.api_methods.first unless @api_methods.empty?
	end


  #http basic authentication
	def http_authenticate_links
		authenticate_or_request_with_http_basic("Apidoc Authentication") do |username, password|
      if	username == "#{DEFAULT_CONFIG["username"]}" and password == "#{DEFAULT_CONFIG["password"]}"
        return true
      else
        access_denied_response
      end
		end
	end

end
