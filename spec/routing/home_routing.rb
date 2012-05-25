require "spec_helper"

describe HomeController do
		describe "route recognition for HomeController" do
			
					
			it "should generate from /home" do
				{:get => "/home"}.should route_to(:controller => "home", :action => "index")
			end
		
			it "should generate from /home" do
				{:get => "/download"}.should route_to(:controller => "home", :action => "downloads")
			end
			
			it "should generate from /home" do
				{:get => "/download_file"}.should route_to(:controller => "home", :action => "download_file")
			end
			
			it "should generate from /home" do
				{:get => "/api_documentation"}.should route_to(:controller => "home", :action => "api_doc")
			end
			
			it "should generate from /home" do
				{:get => "/auth_documentations"}.should route_to(:controller => "home", :action => "auth_doc")
			end
			
			it "should generate from /home" do
				{:get => "/error-codes"}.should route_to(:controller => "home", :action => "error_code")
			end
			
			it "should generate from /home" do
				{:get => "/http-codes"}.should route_to(:controller => "home", :action => "http_code")
			end
			
			it "should generate from /home" do
				{:get => "/getting_started"}.should route_to(:controller => "home", :action => "getting_started")
			end
			
		end
end