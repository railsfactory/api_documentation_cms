require 'spec_helper'

describe ApiMethodsController do
	describe "route recognition for ApiMethodsController" do
		
		it "should generate from GET /api_methods correctly" do
			{:get =>'/api_methods'}.should route_to(:action=>"index", :controller=>"api_methods")
		end
		
		it "should generate from POST /api_methods correctly" do
			{:post =>'/api_methods'}.should route_to(:action=>"create", :controller=>"api_methods")
		end
		
		it "should generate from new /api_methods correctly" do
			{:get => "/api_methods/new"}.should route_to(:action=>"new", :controller=>"api_methods")
		end
		
		it "should generate from DELETE /api_methods correctly" do
			{:delete => "/api_methods/1"}.should route_to(:action=>"destroy", :controller=>"api_methods", :id=> "1")
		end
		
		it "should generate from Update /api_methods correctly" do
			{:put => "/api_methods/1"}.should route_to(:action=>"update", :controller=>"api_methods", :id=>"1")
		end
		
		it "should generate from edit /api_methods correctly" do
			{:get => "/api_methods/1/edit"}.should route_to(:action=>"edit", :controller=>"api_methods", :id=>"1")
		end
		
		it "should generate from show /api_methods correctly" do
			{:get => "/api_methods/1"}.should route_to(:action=>"show", :controller=>"api_methods", :id=>"1")
		end
		
	it "should generate from  /methods correctly" do
			{:get => "/methods/1"}.should route_to(:action=>"method_desc", :controller=>"api_methods", :id=>"1")
		end
		
		it "should generate from  /api correctly" do
			{:get => "/api/1"}.should route_to(:action=>"new", :controller=>"api_methods", :id=>"1")
		end

		it "should generate from  /api correctly" do
			{:get => "/apimethods/1"}.should route_to(:action=>"index", :controller=>"api_methods", :id=>"1")
		end
		
		
		it "should generate from  /apimethod_destroy correctly" do
			{:get => "/apimethod_destroy/1"}.should route_to(:action=>"apimethod_destroy", :controller=>"api_methods", :id=>"1")
		end
		
		it "should generate from  /apimethod_destroy correctly" do
			{:delete => "/delete/1"}.should route_to(:action=>"delete_parameter", :controller=>"api_methods", :id=>"1")
		end
		
		it "should generate from  /post_api_request correctly" do
			{:post => "/post_api_request"}.should route_to(:action=>"post_api_request", :controller=>"api_methods")
		end
		
			
		it "should generate from  /put_api_request correctly" do
			{:get => "/put_api_request"}.should route_to(:action=>"put_api_request", :controller=>"api_methods")
		end
		
				it "should generate from  /get_api_request correctly" do
			{:get => "/get_api_request"}.should route_to(:action=>"get_api_request", :controller=>"api_methods")
		end
		
		it "should generate from  /delete_api_request correctly" do
			{:delete => "/delete_api_request"}.should route_to(:action=>"delete_api_request", :controller=>"api_methods")
		end
		
	end
end
