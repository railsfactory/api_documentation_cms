require 'spec_helper'

describe StaticPagesController do
	describe "route recognition for StaticPageController" do
		
		it "should generate from GET /static_pages correctly" do
			{:get =>'/static_pages'}.should route_to(:action=>"index", :controller=>"static_pages")
		end
		
		it "should generate from POST /static_pages correctly" do
			{:post =>'/static_pages'}.should route_to(:action=>"create", :controller=>"static_pages")
		end
		
		it "should generate from new /static_pages correctly" do
			{:get => "/static_pages/new"}.should route_to(:action=>"new", :controller=>"static_pages")
		end
		
		it "should generate from DELETE /static_pages correctly" do
			{:delete => "/static_pages/1"}.should route_to(:action=>"destroy", :controller=>"static_pages", :id=> "1")
		end
		
		it "should generate from Update /static_pages correctly" do
			{:put => "/static_pages/1"}.should route_to(:action=>"update", :controller=>"static_pages", :id=>"1")
		end
		
		it "should generate from edit /static_pages correctly" do
			{:get => "/static_pages/1/edit"}.should route_to(:action=>"edit", :controller=>"static_pages", :id=>"1")
		end
		
		it "should generate from show /static_pages correctly" do
			{:get => "/static_pages/1"}.should route_to(:action=>"show", :controller=>"static_pages", :id=>"1")
		end
		

	end
end
