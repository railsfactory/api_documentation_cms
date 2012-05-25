class HomeController < ApplicationController
	def index

	end
	def api_doc
    @req_parameters = Parameter.params_list(@api_method.id,true)
    @res_parameters = Parameter.params_list(@api_method.id,false)
		#~ render :partial => "method_desc"
	end
	def auth_doc

	end
	def error_code
		@error = YAML.load_file("#{Rails.root.to_s}/config/error_code.yml")
	end
	def http_code

	end
	def getting_started
    #~ @api_method = ApiList.first.api_methods.first
    #~ if request.xhr?
    #~ render :partial => "getting_started"
    #~ else
    #~ @api_method = nil
    #~ @api = ApiList.find(:all,:order => 'position asc')
    #~ @api_methods = ApiMethod.find(:all,:order => 'position asc')
    #~ render "api_methods/method_desc"
		#~ end
	end
	def downloads
	end
	def download_file
		send_file "#{Rails.root}/public/#{params[:file_name]}", :disposition => 'attachment'
	end

end
