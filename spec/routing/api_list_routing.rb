require "spec_helper"

describe ApiListsController do
		describe "route recognition for ApiListsController" do
			
					
    it "should generate from /api_lists" do
			{:get => "/api_lists"}.should route_to(:controller => "api_lists", :action => "index")
		end
		
    it "should generate from /api_lists" do
			{:post => "/api_lists"}.should route_to(:controller => "api_lists", :action => "create")
		end
		
	
    it "should generate from /api_lists/new" do
			{:get => "/api_lists/new"}.should route_to(:controller => "api_lists", :action => "new")
		end
		
    it "should generate from /api_lists/:id/edit" do
			{:get => "/api_lists/1/edit"}.should route_to(:controller => "api_lists", :action => "edit",:id => "1")
		end
		
    it "should generate from /api_lists/:id" do
			{:get => "/api_lists/1"}.should route_to(:controller => "api_lists", :action => "show",:id => "1")
		end
		
    it "should generate from /api_lists/:id" do
			{:put => "/api_lists/1"}.should route_to(:controller => "api_lists", :action => "update",:id => "1")
		end
		
    it "should generate from /api_lists/:id" do
			{:delete => "/api_lists/1"}.should route_to(:controller => "api_lists", :action => "destroy",:id => "1")
		end
		
    it "should generate from /api_lists/:id" do
			{:delete => "/api_destroy/1"}.should route_to(:controller => "api_lists", :action => "api_destroy",:id => "1")
		end
		
    end
end