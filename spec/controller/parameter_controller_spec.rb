require 'spec_helper'

describe ParametersController ,:type=>"controller" do
	
		before(:each) do
			@parameter = FactoryGirl.create(:parameter)
		end
		
		def parameter_param
			{
			:name =>  "Parameter1" ,
			:description => "description1" ,
			:validation => "",
			:is_request => true ,
			:position => 1 ,
			:api_method_id => 1
			}
		end
	
	describe "GET index" do
		it "find all the api methods" do
			get :index 
			@parameters = Parameter.all
		end
	end
	
	describe "GET 	Show" do
		it "find a particular parameter" do
			get :show , :id => @parameter.id
      @parameter = Parameter.find_by_id(@parameter.id)
		end
	end
	
	describe "GET 	New" do
		it "to create a new parameter" do
			get :new 
			@parameter = Parameter.new
		end
	end
	
	describe "GET 	Edit" do
		it "to edit a particular parameter" do
			get :edit , :id => @parameter.id
			  @parameter = Parameter.find_by_id(@parameter.id)
		end
	end
	
	describe "POST 	Create" do
		it "to create a new parameter" do
		post :create , :id => @parameter.id
			@parameter = Parameter.new(parameter_param)
			@parameter.save
		end
	end

	describe "PUT 	UPDATE" do
		it "to update a particular parameter" do
     put :update ,:id => @parameter.id
      @parameter = Parameter.find_by_id(@parameter.id)
			@parameter.update_attributes(parameter_param)
		end
	end
	
	describe "DELETE destroy" do
		it "delete a particular parameter" do
			delete :destroy , :id => @parameter.id
      @parameter = Parameter.find_by_id(@parameter.id)
			@parameter.destroy
		end
	end
	
end