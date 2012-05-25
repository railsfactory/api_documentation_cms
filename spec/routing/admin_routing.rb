require "spec_helper"

describe AdminController do
		describe "route recognition for AdminController" do
			
					
    it "should generate from /admin" do
			{:get => "/admin"}.should route_to(:controller => "admin", :action => "index")
		end
			
    it "should generate from /admin" do
			{:get => "/settings"}.should route_to(:controller => "admin", :action => "settings")
		end
		
    it "should generate from /admin" do
			{:put => "/update_settings"}.should route_to(:controller => "admin", :action => "update_settings")
		end
		
    end
end