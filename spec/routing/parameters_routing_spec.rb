require 'spec_helper'

describe ParametersController do
	describe "route recognition for ParametersController" do
		
		it "should generate from GET /parameters correctly" do
			{:get =>'/parameters'}.should route_to(:action=>"index", :controller=>"parameters")
		end
		
		it "should generate from POST /parameters correctly" do
			{:post =>'/parameters'}.should route_to(:action=>"create", :controller=>"parameters")
		end
		
		it "should generate from new /parameters correctly" do
			{:get => "/parameters/new"}.should route_to(:action=>"new", :controller=>"parameters")
		end
		
		it "should generate from DELETE /parameters correctly" do
			{:delete => "/parameters/1"}.should route_to(:action=>"destroy", :controller=>"parameters", :id=> "1")
		end
		
		it "should generate from Update /parameters correctly" do
			{:put => "/parameters/1"}.should route_to(:action=>"update", :controller=>"parameters", :id=>"1")
		end
		
		it "should generate from edit /parameters correctly" do
			{:get => "/parameters/1/edit"}.should route_to(:action=>"edit", :controller=>"parameters", :id=>"1")
		end
		
		it "should generate from show /parameters correctly" do
			{:get => "/parameters/1"}.should route_to(:action=>"show", :controller=>"parameters", :id=>"1")
		end
		

	end
end
